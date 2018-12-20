from django.shortcuts import render,redirect,get_object_or_404
from comment import models
from django.conf.urls import *
from blogapp import models
from .forms import commentForms

# Create your views here.

def post_comment(request,pk):
    #接收Post对象
    post=get_object_or_404(models.Post,pk=pk)
    if request.method=='POST':
        #让表单类获得POST提交的数据
        form=commentForms(request.POST)
        #判断提交内容是否正确
        if form.is_valid():
            print(post.title)
            #获得表单对象
            comment=form.save(commit=False)
            #匹配外键
            comment.post=post
            #保存
            comment.save()
            #重定向中放入模型类对象，会自动调get_absolute_url获得url
            return redirect(post)
        #数据不合法
        else:
            comment_list=post.comment_set.all()
            context={
                'comment_list':comment_list,
                'form':form,
                'post':post
            }
            return render(request,'blogapp/detail.html',context)
    return redirect(post)



