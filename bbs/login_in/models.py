from django.db import models
from django.contrib.auth.models import AbstractUser
from django.urls import reverse

class User(AbstractUser):
    #头像
    image_url=models.ImageField(upload_to='media',null=True)
    email=models.EmailField(blank=False,unique=True)
    #国家
    country=models.ForeignKey('Country',null=True)
    #注册时间
    register_time=models.DateTimeField(auto_now_add=True,null=True)
    #登陆时间
    login_time=models.DateTimeField(auto_now_add=True,null=True)
    # 获得个人空间url
    def get_absolute_url(self):
       return reverse('myhome:index',kwargs={'pk':self.pk})

    def get_absolute_url_index(self):
        return reverse('bbsapp:index')

    class Meta(AbstractUser.Meta):
        pass

class Country(models.Model):
    name=models.CharField(max_length=20)

class history(models.Model):
    # 历史纪录
    article_history=models.IntegerField()
    # 用户
    user=models.ForeignKey(User)
    # 时间
    startime=models.DateTimeField(auto_now_add=True,null=True)