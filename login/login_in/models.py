from django.db import models
# 继承AbstractUser类
from django.contrib.auth.models import AbstractUser
# Create your models here.
class User(AbstractUser):
    #昵称
    nickname=models.CharField(max_length=50)
    email = models.EmailField('邮箱', unique=True, error_messages={ 'unique': "该邮箱地址已被占用。",},)
    class Meta(AbstractUser.Meta):
        pass