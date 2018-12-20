from django.db import models

# Create your models here.
#自定义数据库管理器,通过复写get_queryset方法
class mymanager(models.Manager):
    def get_queryset(self):
        return super(mymanager,self).get_queryset().filter(isdelete=False)
    #创建数据简写方法
    def create(self,btitle,date):
        b=Bookinfo()
        b.btitle=btitle
        b.datetime=date
        b.bread=0
        b.bcomment=0
        b.isdelete=False
        return b


class Bookinfo(models.Model):
    btitle=models.CharField(max_length=30)
    datetime=models.DateTimeField()
    bread=models.IntegerField(default=0)
    bcomment=models.IntegerField(null=False)
    isdelete=models.BooleanField(default=False)
    #自定义管理器对象
    books1=models.Manager()
    books2=mymanager()
    def __str__(self):
        return self.btitle
        #制定表的名字
    class Meta:
        db_table='bookinfo'

class Heroinfo(models.Model):
    hname=models.CharField(max_length=30)
    hgender=models.BooleanField(default=True)
    hcontent=models.CharField(max_length=1030)
    isdelete=models.BooleanField(default=False)
    book=models.ForeignKey('Bookinfo')


