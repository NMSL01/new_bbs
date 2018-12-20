from django.contrib.auth.forms import UserCreationForm
from django import forms
from .models import *
from captcha.fields import CaptchaField
from django.core.exceptions import ValidationError
import re
from django.forms import fields,widgets


#注册
class registerform(forms.Form):
    username=fields.CharField(max_length=30,
                                label='用户名',
                              error_messages={'required':'用户名不能为空！'},
                              widget=widgets.TextInput(attrs={'class':'username','placeholder':'请输入用户名'}))
    password=fields.CharField(max_length=30,
                   error_messages={'required':'密码不能空!'},
                   widget=widgets.PasswordInput(attrs={'class':'pass','placeholder':'请输入密码'}) 
    )
    password2=fields.CharField(max_length=30,
                   error_messages={'required':'密码不能空!'},
                   widget=widgets.PasswordInput(attrs={'class':'pass','placeholder':'请确认密码'}) 
    )
    email=fields.EmailField(max_length=30,
                   error_messages={'required':'邮箱不能空!'},
                    )
    country=fields.CharField(initial=1,widget=widgets.Select(choices=((1,'美国'),(2,'日本'))))
    
    image_url=fields.ImageField(required=False)


    #验证码生成
    captcha=CaptchaField()    
    
    def clean_username(self):
        #cleaned_data为表单内容的字典
        name=self.cleaned_data['username']
        if len(name)<1 or len(name)>30: 
            raise ValidationError('用户名必须在1-30字符内!')
        if User.objects.filter(username=name):
            raise ValidationError('用户名已存在!')
            #必须return 表单内容
        return name
        
    def clean_password(self):
        pass1=self.cleaned_data['password']
        if len(pass1)<6 or len(pass1)>30:
            raise ValidationError('密码长度在6-30字符内')
        return pass1

    def clean_password2(self):
        pass2=self.cleaned_data['password2']
        pass1=self.cleaned_data['password']
        if pass1!=pass2:
            raise ValidationError('两次密码不一致!')
        return pass2
    def clean_email(self):
        em=self.cleaned_data['email']
        if User.objects.filter(email=em):
            raise ValidationError('邮箱已被注册！')
        return em


#登录功能
class login_1(forms.Form):
    username=fields.CharField(max_length=30,
                            error_messages={'required':'用户名不能为空!'},
                            widget=widgets.TextInput(attrs={'class':'username','placeholder':'请输入用户名:'}))
    password=fields.CharField(max_length=30,
                              error_messages={'required':'密码不能为空！'},
                              widget=widgets.PasswordInput(attrs={'class':'password','placeholder':'请输入密码：'}))
    #记住用户名
    rember=fields.CharField(required=False,
                                widget=widgets.CheckboxInput())

    #验证用户名
    def clean_username(self):
        user=self.cleaned_data.get('username')
        if len(user)>29:
            raise ValidationError('用户名不存在！')
        if not User.objects.filter(username=user):
            raise ValidationError('用户名不存在!')
        return user
    def clean_password(self):
        user=self.cleaned_data.get('username')
        pass1=self.cleaned_data.get('password')
        if user:
            if pass1!=User.objects.get(username=user).password:
                raise ValidationError('用户名或密码错误!')
        return pass1

        



    
            
            


