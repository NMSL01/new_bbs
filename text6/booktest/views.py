from django.shortcuts import render,redirect
from django.http import *
import datetime,os
from text6 import settings
from booktest import models
from django.core.paginator import Paginator
# Create your views here.
def index(request):
    #创建响应对象
    res=HttpResponse()
    #设置cookie，失效时间
    res.set_cookie('a','2',None,datetime.datetime(2018,12,10))
    #返回数据
    res.write('hello')
    return res

def extends(request):
    return render(request,'booktest/child1.html')

def child1(request):
    return render(request,'booktest/child2.html')

#html转义
def zhuanyi(request):
    context={'list':"<h1>dsad</h1>"}
    return render(request,"booktest/zhuanyi.html",context)

#url反向解析,在url中设置name
def jiexi(request):
    return render(request,'booktest/fanxiang.html')

#静态页面,页面显示setting中地址
def statics(request):
    return render(request,'booktest/static.html')

#文件上传
def load(request):
    return render(request,'booktest/load.html')

#下载到静态文件中,在form中加入enctype
def down(request):
    res=request.FILES['file']
    name=os.path.join(settings.META_DIR,res.name)
    print(name)
    with open(name,'wb') as t:
        for i in res.chunks():
            t.write(i)
    return HttpResponse('<img src="static/meda/%s">'%res.name)

#分页Paginator(列表,分页数),返回分页对象,
# 返回制定页面Paginator().page()
# page.page_range返回页数列表,
def page(request,num):
    if num=='':
        num=1
    res=models.book.books1.all()    
    res1=Paginator(res,6)
    page1=res1.page(int(num))
    context={'list':page1,'list_2':res1,'list_3':int(num)}
    return render(request,'booktest/page.html',context)

def ajax1(request):
    return render(request,'booktest/ajax.html')
def chuli(num):
    list_1=[]
    for i in num:
        list_1.append([i.codeid,i.cityName])
    context={'list':list_1}
    return  context 
def ajax(request,num):
    res=models.area.objects.filter(parentid=int(num))
    if int(num)==0:
        return JsonResponse(chuli(res))
    if int(num)==1:
        res1=request.POST["num"]
        print(res1,"dsads")
        res2=models.area.objects.filter(parentid=int(res1))
        return JsonResponse(chuli(res2))
    if int(num)==2:
        res11=request.POST['num']
        res22=models.area.objects.filter(parentid=int(res11))
        return JsonResponse(chuli(res22))


