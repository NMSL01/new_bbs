from django.db import models
from django.db.models import *
# from tinymce.models import HTMLField
class mymodel(models.Manager):
    def create(self,user,pwd):
        b=Username()
        b.uname=user
        b.upassword=pwd
        b.udelete=0
        return b
# Create your models here.
class Username(models.Model):
    uname=models.CharField(max_length=50)
    upassword=models.CharField(max_length=20)
    udelete=models.BooleanField()
    books1=mymodel()

class area(models.Model):
    codeid=models.IntegerField()    
    parentid=models.IntegerField()    
    cityName=models.CharField(max_length=100)

#富文本编辑器
