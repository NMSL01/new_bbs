#from django.shortcuts import render
from django.http import *
from django.template import RequestContext,loader
from django.shortcuts import render
from booktest import *
# Create your views here.
def index(request):
    res=models.Bookinfo.objects.all()
    context={'list':res}
    return render(request,'booktest/index.html',context)
def show(request,id):
    # temp=loader.get_template('booktest/index.html')
    # return HttpResponse(temp.render()) 
    res=models.Bookinfo.objects.get(pk=id)
    list_hero=res.heroinfo_set.all()
    context={'list':list_hero}
    return render(request,'booktest/show.html',context)

