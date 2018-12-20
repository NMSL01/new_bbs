from django.shortcuts import render
from django.http import *
from django.conf import settings
import os 
from django.core.paginator import Paginator
from booktest import models
# Create your views here.

def index(request):
    return render(request,'booktest/img.html')

def load(request):
    return render(request,'booktest/load.html')

def sumbit(request):
    res=request.FILES['file']
    fname=os.path.join(settings.MEDIA_ROOT,res.name)
    with open(fname,'wb') as t:
        for i in res.chunks():
            t.write(i)
    return HttpResponse('<img src="/aaa/media/%s" />'%res.name)

def page(request,num):
    if num=='':
        num=1
    res=models.Username.books1.all()    
    res1=Paginator(res,5)
    page=res1.page(str(num))
    index=res1.page_range
    context={"list":page,'page':index,'num':int(num)}
    return render(request,'booktest/page.html',context)

def area(request):
    return render(request,'booktest/area.html')

def chuli(res):
    list_1=[]
    for i in res:
        list_1.append([i.codeid,i.cityName])
    context={'list':list_1}
    return context

def area0(request,number):
    if int(number)==0:
        res=models.area.objects.filter(parentid=0)    
        return JsonResponse(chuli(res))

    if int(number)==1:
        res_2=request.POST['num']
        res_21=models.area.objects.filter(parentid=int(res_2))    
        return JsonResponse(chuli(res_21))

    if int(number)==2:
        res_3=request.POST['num']
        res_31=models.area.objects.filter(parentid=int(res_3))    
        return JsonResponse(chuli(res_31))