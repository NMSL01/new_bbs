from django.db import models

# Create your models here.
class mybbs(models.manager.Manager):
    def create(self,s1,s2,s3):
        b=bbs()
        b.d1=s1
        b.d2=s2
        b.d3=s3
        return b


class bbs(models.Model):
    d1=models.CharField(max_length=100)
    d2=models.CharField(max_length=100)
    d3=models.CharField(max_length=100)
    def __str__(self):
        return self.d1