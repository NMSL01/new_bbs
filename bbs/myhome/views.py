from django.shortcuts import render,redirect
from django.views.generic import ListView
from bbsapp import models as mo
from login_in import models


# 个人主页的文章页面
class index(ListView):
    template_name = 'myhome/home.html'
    # get_queryset拿到的数据的名称
    context_object_name = 'result'
    paginate_by = 10
    user_id=None
    next=None
    def get(self, request, pk, **kwargs):
        self.user_id=pk
        # 判断什么顺序查询文章
        next=request.GET.get('next',None)
        self.next=next
        return super().get(request,pk,**kwargs)
    # 分页数据
    def get_queryset(self):
        # 按时间排序
        if self.next=='time':
            return models.User.objects.get(pk=self.user_id).article_set.all().order_by('-startime')
        # 按热度排序
        if self.next=='hot':
            return models.User.objects.get(pk=self.user_id).article_set.all().order_by('-click_count')
        # 默认排序
        return models.User.objects.get(pk=self.user_id).article_set.all()


    # 视图类中context传参使用get_context_data
    def get_context_data(self, **kwargs):
        # 获得context对象
        context = super(index, self).get_context_data(**kwargs)
        # 分页对象
        paginator = context.get('paginator')
        # 当前也对象
        page = context.get('page_obj')
        # 是否分页
        is_paginated = context.get('is_paginated')

        # 在context中加入文章
        # if self.article_id!=None:
        #     article=models.Article.objects.get(id=self.article_id)
        #     context.update({'article':article})
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

# 最新回复
class newcomment(index):
    template_name = 'myhome/newcomment.html'
    context_object_name = 'result'
    paginate_by = 10
    userid=None
    def get(self, request, *args, **kwargs):
        self.userid=request.session.get('login').get('id')
        # 拿到查询字符串，选择不同模板
        if request.GET.get('next')=='to_comment_me':
            # 选择我的回复模板
            self.template_name='myhome/comment_to_me.html'
        return super().get(request,'',**kwargs)

    def get_queryset(self):
        # 获得user对象
        user=models.User.objects.get(pk=self.userid)
        # 获得对新评论对象
        return user.this_user.all()

def history(request):
    return render(request,'myhome/history.html')





















