#coding=utf-8
from django.shortcuts import render
from django.http import *
from bookinfo import models
from django.db.models import *
# Create your views here.
def index(request):

    # list1=models.Bookinfo.books1.filter(heroinfo__hname__contains='胡dsa')
    #聚合操作模板直接取值
    # list1=models.Bookinfo.books1.aggregate(Count('datetime'))
    list1=models.Bookinfo.books1.filter(bread=F('bcomment'))
    context={'list':list1}
    return render(request,'bookinfo/index.html',context)
