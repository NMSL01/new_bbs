from django.shortcuts import render,get_object_or_404
from django.http import *
from blogapp import models
from markdown import markdown
from comment.forms import commentForms
from django.views.generic import ListView
from django.core.paginator import Paginator
# Create your views here.
# def index(request):
#     post=models.Post.objects.all()
#     context={'post':post}
#     return render(request,'blogapp/index.html',context) 

def detail(request,pk):
    post=get_object_or_404(models.Post,pk=pk)
    post.plus_views()
    post.content=markdown(post.content,extensions=[
                                    'markdown.extensions.extra',
                                    'markdown.extensions.codehilite',
                                    'markdown.extensions.toc',
    ])
    comment_res=post.comment_set.all().order_by('-create_time')
    form=commentForms()
    return render(request,'blogapp/detail.html',{"comment":comment_res,'form':form,'post':post})          

#按月归档
def guidang(request,year,month):
    post=models.Post.objects.filter(startime__year=year,startime__month=month)
    return render(request,'blogapp/index.html',context={'post':post})

def tag(request,pk):
    tag_1=get_object_or_404(models.Tag,pk=pk)
    tag_1=models.Post.objects.filter(tag=tag_1)
    return render(request,'blogapp/index.html',context={'post':tag_1})
# 分类
# def fenlei(request,pk):
#     #两种方式，一种利用category类对象调用类中reverse获取url，
#     #一种利用url反向解析获取url
#     post=get_object_or_404(models.Category,pk=pk)
#     post=models.Post.objects.filter(category=post)
#     return render(request,'blogapp/index.html',context={'post':post})

    #利用category的获取外键方法获取post对象
    # post=mdels.Category.objects.get(name=category)
    # post=post.post_set.all()


#视图类可以用继承减少重复代码，如获得分页效果和重复获得文章对象
class indexview(ListView):
    #拿到post对象
    model=models.Post
    #指定模板
    template_name='blogapp/index.html'
    #定义对象列表名称相当于context名称
    context_object_name='post'
    #设置分页
    paginate_by=2

class categoryview(indexview):
    #视图类获得对象需要调用get_queryset方法，复写方法添加筛选条件
    def get_queryset(self):
        cate=get_object_or_404(models.Category,pk=self.kwargs.get('pk'))
        #调用父类方法获得post对象
        return super(categoryview,self).get_queryset().filter(category=cate)

#自定义分类函数
class indexview(ListView):
    model=models.Post
    template_name='blogapp/index.html'
    context_object_name='post'
    paginate_by=2
    #视图函数中context传参使用get_context_data
    def get_context_data(self,**kwargs):
        #获得context对象
        context=super(indexview,self).get_context_data(**kwargs)
        #分页对象
        paginator=context.get('paginator')
        #当前也对象
        page=context.get('page_obj')
        #是否分页
        is_paginated=context.get('is_paginated')

        res=self.mypaginator(paginator,page,is_paginated)
        context.update(res)
        return context
    
    

    def mypaginator(self,paginator,page,is_paginated):
        left,right=[],[]
        left_dian,right_dian=False,False
        first,last=False,False
        nowpage_num=page.number
        page_list=paginator.page_range
        all_page_number=paginator.num_pages
        if nowpage_num==1:
            right=page_list[nowpage_num:nowpage_num+2]
            if right[-1]<all_page_number-1:
                right_dian=True
            if right[-1]<all_page_number:
                last=True
        elif nowpage_num==all_page_number:
            left=page_list[nowpage_num-3:nowpage_num-1]
            if left[0]>page_list[1]:
                left_dian=True
            if left[0]>page_list[0]:
                first=True
        else:
            left=page_list[nowpage_num-2:nowpage_num-1]
            right=page_list[nowpage_num:nowpage_num+2]
            if right[-1]<all_page_number-1:
                right_dian=True
            if right[-1]<all_page_number:
                last=True
            if left[0]>page_list[1]:
                left_dian=True
            if left[0]>page_list[0]:
                first=True
        context={
            'left':left,
            'right':right,
            'left_dian':left_dian,
            'right_dian':right_dian,
            'first':first,
            'last':last
        }
        return context
            

            










        

   
