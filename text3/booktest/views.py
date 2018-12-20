from django.shortcuts import render,redirect
from django.http import *
# Create your views here.
def index(request):
    return HttpResponse('sss')

def getext(request):
    return render(request,'booktest/gettext.html')

#一键一值
def getext2(request):
    #GET[]=GET.get()
    re1=request.GET['a']
    re2=request.GET['b']
    re3=request.GET['c']
    context={'a1':re1,'b1':re2,'c1':re3}
    return render(request,'booktest/gettext2.html',context)
def getext3(request):
    #GET[]=GET.get()
    #键可以重复，通过getlist得到相同键的值
    res=request.GET.getlist('a')
    context={'res':res}
    return render(request,'booktest/gettext3.html',context)



#session处理登录
#选择页面
def session_1(request):
    res=request.session.get('myname')
    context={'list':res}
    return render(request,'booktest/session_1.html',context)
#登录页面
def session_2(request):
    return render(request,'booktest/session_2.html')
#存储页面,重定向会初始页面
def session_3(request):
    res=request.POST['name']
    request.session['myname']=res
    return redirect('/login/')


#删除session页面
def session_4(request):
    del request.session['myname']
    return redirect('/login/')


