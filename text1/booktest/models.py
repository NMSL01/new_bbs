from django.db import models
from tinymce.models import HTMLField
# Create your models here.
class Bookinfo(models.Model):
    btitle=models.CharField(max_length=20)
    datetime=models.DateTimeField()
    def __str__(self):
        return self.btitle
class Heroinfo(models.Model):
    def __str__(self):
        return self.hname
    hname=models.CharField(max_length=30)
    hgender=models.BooleanField()
    hcontent=HTMLField()
    hbook=models.ForeignKey('Bookinfo')
