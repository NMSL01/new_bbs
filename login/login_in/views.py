from django.shortcuts import render,redirect
from django.http import *
from login_in import forms
# Create your views here.
def register(request):
    newurl=request.POST.get("next",request.GET.get('next',''))
    if request.method=='POST':
        form=forms.registerform(request.POST)
        if form.is_valid():
            form.save()
            if newurl:
                return redirect(newurl)
            else:
                return redirect('/index')
    else:
        form=forms.registerform()
    return render(request,'login_in/register.html',context={'form':form})


def index(request):
    return render(request,'login_in/index.html')
