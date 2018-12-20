from django.db import models

# Create your models here.
class mymange(models.Manager):
    def create(self,s1,s2):
        b=book()
        b.bname=s1
        b.btitle=s2
        return b

class book(models.Model):
    bname=models.CharField(max_length=20)
    btitle=models.CharField(max_length=20)
    books1=models.Manager()

class area(models.Model):
    codeid=models.IntegerField()
    parentid=models.IntegerField()
    cityName=models.CharField(max_length=180)



