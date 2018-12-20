from django.shortcuts import render
from text import models
from django.http import *
# Create your views here.
def index(request):
    return render(request,'text/index.html')
def index_2(request,num):
    res=models.bbs.objects.filter(id__gt=num)[:10]
    list_1=[]
    for i in res:
        list_1.append([i.d1,i.d2,i.d3,i.id]) 

    return JsonResponse({'list':list_1})

