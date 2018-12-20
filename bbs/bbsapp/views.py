import time,re,json,os
from django.shortcuts import render, redirect
from django.http import *
from bbsapp import models
from django.views.generic import ListView
from login_in import models as mo
from django.utils import timezone
from django.core.paginator import Paginator
from bbsapp import forms
from bbs import settings
from django.views.decorators.cache import cache_page
# Create your views here.
# 论坛主页

# @cache_page(60*60)
def index(request):
    return render(request, 'bbsapp/index.html')

# 评论页面获取和分页函数(包括文章内容)
class comment(ListView):
    template_name = 'bbsapp/comment.html'
    # get_queryset拿到的数据的名称
    context_object_name = 'result'
    paginate_by = 5
    article_id=None

    # 调用父类get方法获得url传参
    # ListView执行顺序，get,get_queryset,get_context_object
    def get(self, request, pk, **kwargs):
        self.article_id=pk
        login=request.session.get('login')
        # 记录历史记录
        if login:
            mo.history(user=mo.User.objects.get(id=login.get('id')),
                       article_history=models.Article.objects.get(pk=self.article_id).id).save()
        return super().get(request,pk,**kwargs)
    # 分页数据
    def get_queryset(self):
        # 调用更新阅读量函数
        models.Article.objects.get(id=self.article_id).count()
        # 获取评论分页的数据
        return models.Article.objects.get(id=self.article_id).comment_set.filter(floor_id='None')

    # 视图类中context传参使用get_context_data
    def get_context_data(self, **kwargs):
        # 获得context对象
        context = super(comment, self).get_context_data(**kwargs)
        # 分页对象
        paginator = context.get('paginator')
        # 当前也对象
        page = context.get('page_obj')
        # 是否分页
        is_paginated = context.get('is_paginated')

        # 在context中加入文章
        if self.article_id!=None:
            article=models.Article.objects.get(id=self.article_id)
            context.update({'article':article})
        # 判断是否分页
        if is_paginated:
            res = self.mypaginator(paginator, page, is_paginated)
            context.update(res)
            return context
        return context

    def mypaginator(self, paginator, page, is_paginated):
        left, right = [], []
        left_dian, right_dian = False, False
        first, last = False, False
        nowpage_num = page.number
        page_list = paginator.page_range
        all_page_number = paginator.num_pages
        if nowpage_num == 1:
            right = page_list[nowpage_num:nowpage_num + 2]
            if right[-1] < all_page_number - 1:
                right_dian = True
            if right[-1] < all_page_number:
                last = True
        elif nowpage_num == all_page_number:
            left = page_list[nowpage_num - 3:nowpage_num - 1]
            if left[0] > page_list[1]:
                left_dian = True
            if left[0] > page_list[0]:
                first = True
        else:
            left = page_list[nowpage_num - 2:nowpage_num - 1]
            right = page_list[nowpage_num:nowpage_num + 2]
            if right[-1] < all_page_number - 1:
                right_dian = True
            if right[-1] < all_page_number:
                last = True
            if left[0] > page_list[1]:
                left_dian = True
            if left[0] > page_list[0]:
                first = True
        context = {
            'left': left,
            'right': right,
            'left_dian': left_dian,
            'right_dian': right_dian,
            'first': first,
            'last': last
        }
        return context

# 板块分页类，继承评论分页类
class category_index(comment):
    template_name = 'bbsapp/lol_index.html'
    # get_queryset()得到的数据的name
    context_object_name = 'a_list'
    paginate_by = 10
    category_id=None
    # 首页展示部分内容,listview源码是先分页在返回context,所以context只有10条，
    def get_context_data(self, **kwargs):
        context=super().get_context_data(**kwargs)
        result=context.get('a_list')
        filter_context=[]
        for i in result:
            filter_context.append(''.join(re.findall('<img src="/media/.{1,60}/>',i.content)[:3]))
        context.update({'only_image':filter_context})
        return context

    # 筛选出文章列表
    def get_queryset(self):
        return  models.Category.objects.filter(pk=self.category_id)[0].article_set.all().order_by('-startime')
    #  获得文章id

    def get(self, request, pk, **kwargs):
        # 从get请求中拿到文章id
        self.category_id=pk
        # get源码中第一步获取get_queryset()，所以先重写get_queryset()拿到筛选数据
        return  super(comment,self).get(request,pk,**kwargs)


#显示多级评论
def this_comment(request):
    #父id
    floor_id=request.POST['floor_id']
    #评论文章id
    article_id=request.POST['article']

    #  获得文章该楼曾所有评论的集合
    res=models.Comment.objects.filter(floor_id=floor_id)[:5]
    count=models.Comment.objects.filter(floor_id=floor_id).count()
    res_1=[]
    for i in res:
        fathername=models.Comment.objects.get(id=i.father_id).user.username
        if i.father_id==i.floor_id:
            fathername=' '+fathername
        res_1.append({'id':i.id,
                    'startime':i.startime,
                    'content':i.content,
                    'fathername':fathername,
                    'username':i.user.username}
                      )
    return JsonResponse({'result':res_1,'floor_id':floor_id,'count':count})



#提交评论
def comment_submit(request):
    #父id,如果为楼层评论,默认为None
    father_id=request.POST.get('father_id',None)
    #一级id,即用户id
    user_id=request.session.get('login').get('id')
    #评论文章id
    article_id=request.POST['article']
    #获取评论内容
    content=request.POST['content']
    #评论时间
    startime=timezone.now()
    #floor_id,为None标志为楼层评论
    floor_id=request.POST.get('floor_id',None)
    # 用户
    user=mo.User.objects.get(id=str(user_id))
    # 父评论id
    this_comment_id=request.POST.get('this_comment_id')
    # 更新评论
    update=models.Comment(user=user,
                   article=models.Article.objects.get(id=article_id),startime=startime,
                   father_id=str(father_id),content=content,
                    floor_id=str(floor_id))

    update.save()
    if father_id!=None:
        username=models.Comment.objects.get(id=update.id).user.username
        fathername=models.Comment.objects.get(id=father_id).user.username
        #获得是否为二级评论,如果为1就是二级评论，2为多级评论
        if father_id==floor_id:
            fathername=' '+fathername
        context={'fathername':fathername,'id':update.id,'startime':update.startime,'content':content,'username':username}
    # 更新评论关系，评论了谁
        models.to_Comment(user=user,to_user=models.Comment.objects.get(id=father_id).user,
                          comment=father_id,
                          startime=startime).save()
        # 更新评论关系，被谁评论
        models.to_Comment(user=models.Comment.objects.get(id=father_id).user,
                          to_user=user,to_comment=update.id,
                          startime=startime).save()
        return JsonResponse({'result':[context],'floor_id':floor_id})

    if floor_id==None:
        # 更新评论关系，评论了谁
        models.to_Comment(user=user,to_user=models.Article.objects.get(id=article_id).user,
                          comment=this_comment_id,
                          startime=startime).save()
        # 更新评论关系，被谁评论
        models.to_Comment(user=models.Article.objects.get(id=article_id).user,
                          to_user=user,to_comment=update.id,
                          startime=startime).save()
        # 文章对象，重新进入评论页面
        art=models.Article.objects.get(id=article_id)
        return redirect(art.get_absolute_url())

#楼中楼分页
def comment_paginator(request):
    floor_id=request.POST.get('floor_id')
    #请求页码
    num=request.POST.get('num','1')
    #获得子评论
    all_comment=models.Comment.objects.filter(floor_id=floor_id)
    # 分页父对象
    page=Paginator(all_comment,10)
    # 当前页对象
    page_list=page.page(int(num))
    number=page_list.number
    res_1=[]
    for i in page_list:
        #替换username，fathername
        fathername=models.Comment.objects.get(id=i.floor_id).user.username
        #区分标志
        if i.father_id==i.floor_id:
            fathername=' '+fathername
        res_1.append({'id':i.id,
                    'startime':i.startime,
                    'content':i.content,
                    'fathername':fathername,
                    'username':i.user.username}
                      )

    return JsonResponse({'page_list':res_1,'page_range':list(page.page_range),'page_num':number})


# 文章图片上传
def kind_upload(request):
    imgfile=request.FILES.get('upload_img',None)

    if imgfile:
        result=img_type(imgfile)
        return HttpResponse(json.dumps(result),content_type='application/json')

# 图片上传
def img_type(file):
    result={'error':0,'message':'上传失败'}
    # 允许上传文件类型
    type_valid= ['jpg', 'png', 'jpeg', 'gif', 'bmp']
    try:
        filename=re.search('\..+',file.name).group()[1:]
    except:
        pass
    if filename not in type_valid or (len(file)>5242880):
        result['error']=1
        return result
    else:
        filename_1=time.strftime('%Y%m%d%H%M%s')+file.name
        filename=os.path.join(settings.BASE_DIR,'static/media/',filename_1)
        with open(filename,'wb') as t:
           for i in file.chunks():
               t.write(i)
        del result['message']
        result['url']='/media/%s'%filename_1
        return result
#

# 发表文章提交
def article_submit(request,pk):
    user=mo.User.objects.get(id=request.session.get('login').get('id'))
    if user:
        title=request.POST.get('title')
        content=request.POST.get('content')
        startime=timezone.now()
        category=models.Category.objects.get(pk=pk)
        # 获得用户对象，session
        update=models.Article(title=title,
                       content=content,startime=startime,
                       category=category,user=user)
        update.save()
        return redirect(category.get_absolute_url())



# 搜索
def mysearch(request):
    return render(request,'bbsapp/mysearch.html')

# # 多图上传
# def webuploader(request):
#     file=request.FILES.get('file')
#     print(file)
#     filename_1=time.strftime('%Y%m%d%H%M%s')+file.name
#     filename=os.path.join(settings.BASE_DIR,'static/media/',filename_1)
#     print(filename)
#     with open(filename,'wb') as t:
#         for i in file.chunks():
#             t.write(i)
#
#     return HttpResponse('aa')








           