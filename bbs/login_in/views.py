from django.core.cache import cache
from django.shortcuts import render,redirect
from django.views.generic import ListView
from login_in import models
from django.http import JsonResponse, HttpResponse
from bbs import settings
from django.core.mail import send_mail
import random
# Create your views here.


#注册页面
class send(ListView):
    def get(self, request, *args, **kwargs):
        username=request.GET.get('username')
        email=request.GET.get('email')
        if username:
            if models.User.objects.filter(username=username):
                return JsonResponse({'errors':'用户名以存在！'})
        if email:
            if models.User.objects.filter(email=email):
                return JsonResponse({'errors':'邮箱以被注册！'})
        return  render(request,'login_in/index.html')

    def post(self,request,*args,**kwargs):
        username=request.POST.get('username')
        email=request.POST.get('email')
        password=request.POST.get('password')
        update=models.User(username=username,
                    email=email,
                    password=password)
        update.save()
        return redirect(update.get_absolute_url_index())

# 登陆页面
class login(ListView):
    # 验证
    def post(self,request,*args,**kwargs):
        username=request.POST.get('username')
        password=request.POST.get('password')
        true_name=models.User.objects.filter(username=username)
        if true_name:
            if true_name[0].password==password:
                # 传递在线用户id和username
                context_session={'username':true_name[0].username,'id':true_name[0].id}
                # 存入登陆信息
                request.session['login']=context_session
                # 获取登陆前的网址
                prev_url=request.POST.get('next')
                print(prev_url)
                return redirect(prev_url)
            else:
                return render(request,'login_in/index.html',context={'errors':'用户名或密码错误！'})
        else:
            return render(request,'login_in/index.html',context={'errors':'用户名不存在！'})

    # 返回空页面
    def get(self, request, *args, **kwargs):
        next=request.GET.get('next')
        return render(request,'login_in/index.html',context={'next':next})

def login_out(request):
    try:
        del request.session['login']
    except:
        pass
    return redirect('/')




# 邮箱密码zhaohui
class newpassword(ListView):
    def post(self,request,*args,**kwargs):
        # 判断验证马
        if request.POST.get('yanzhengma'):
            # 拿到缓存邮箱的验证码
            email=cache.get(request.POST.get('email'))
            # 判断邮箱是否失效90s，并判断验证马
            if email and request.POST.get('yanzhengma')==email:
                return render(request,'login_in/new_password.html',context={'next_2':'right'})
            # 返回错误信息
            else:
                return render(request,'login_in/new_password.html',context={'next':email,'result':'not right'})
        # 判断邮箱是否存在，
        else:
            email=request.POST.get('email')
            try:
                models.User.objects.get(email=email)
            except:
                return render(request,'login_in/new_password.html',context={'result':'该邮箱为注册'})
            else:
                # 邮箱存在发送验证马
                try:
                    from .task import send_email
                    send_email.delay(email)
                except Exception as e:
                    print(e)
                return render(request,'login_in/new_password.html',context={'next':email})
    # 默认页面
    def get(self,request,*args,**kwargs):
        return render(request,'login_in/new_password.html')





#
# def register(request):
#     if request.method=='POST':
#         form=forms.registerform(request.POST,request.FILES)
#         if form.is_valid():
#             #对图片重命名
#             img_id=models.User.objects.all().order_by('-id')
#             try:
#                 request.FILES.get('image_url').name=str(int(img_id[0].id)+1)+'.jpg'
#             except:
#                 pass
#             #进行自定义验证，并获得表单字典格式
#             form_con=form.clean()
#             models.User(
#                 username=form_con['username'],
#                 password=form_con['password'],
#                 email=form_con['email'],
#                 country=models.Country.objects.get(pk=form_con['country']),
#                 image_url=form.cleaned_data['image_url'],
#                 register_time=timezone.now()
#
#             ).save()
#             user_online=models.User.objects.filter(username=form_con['username'])
#             return render(request,'bbsapp/index.html',context={'user_online':user_online[0]})
#         else:
#             # error=form.errors
#             #不合法,返回form对象,即含有错误信息的表单
#             return render(request,'login_in/register.html',context={'form':form})
#     else:
#         form=forms.registerform()
#     return render(request,'login_in/register.html',context={'form':form})
#
#登录




# def login(request):
#     if request.method=='POST':
#         form=forms.login_1(request.POST)
#         if form.is_valid():
#             #验证自定义方法，返回表单字典格式数据
#             form_con=form.clean()
#             #登录对象,get返回一个对象，回报异常，filter返回列表不报异常
#             user_update=models.User.objects.filter(username=form_con['username'])[0]
#             user_update.login_time=timezone.now()
#             #记录登录时间，更新指点个字段
#             user_update.save(update_fields=['login_time'])
#             #登录成功将登录对象传递值首页
#             return render(request,'bbsapp/index.html',context={'user_online':user_update})
#
#         else:
#             print('sssssssssssssssssssssssssssssssssssssssss')
#             return render(request,'login_in/login.html',context={'form':form})
#     else:
#         form=forms.login_1()
#     return render(request,'login_in/login.html',context={'form':form})
#









    
