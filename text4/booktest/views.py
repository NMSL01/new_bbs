from django.shortcuts import render,redirect
from django.http import *
from booktest import models
# Create your views here.
def index(request):
    list_1=models.Bookinfo.objects.all()
    context={'list':list_1}
    return render(request,'booktest/index.html',context)

def show(request,l1):
    context={'list':l1}
    return render(request,'booktest/show.html',context)

def index2(request):
    return render(request,'booktest/user2.html')

def index3(request):
    return render(request,'booktest/user3.html')

def zhuanyi(request):
    res="<h1>dsa</h1>"
    context={"list":res}
    return render(request,'booktest/zhuanyi.html',context)