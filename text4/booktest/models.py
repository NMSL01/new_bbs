from django.db import models

class mymanager(models.Manager):
    def get_queryset(self):
        return super(mymanager,self).get_queryset().filter(isdelete=False)
    #创建数据简写方法
    def create(self,btitle,date):
        b=Bookinfo()
        b.btitle=btitle
        b.date=date
        b.bread=0
        b.bcommit=0
        b.isDelete=False
        return b

class Bookinfo(models.Model):
    btitle=models.CharField(max_length=30)
    date=models.DateTimeField(db_column="datetime")
    bread=models.IntegerField()
    bcommit=models.IntegerField()
    isDelete=models.BooleanField()
    class Meta():
        db_table='bookinfo2'


class Heroinfo(models.Model):
    hname=models.CharField(max_length=30)
    hgender=models.BooleanField()
    hcontent=models.TextField()
    isDelete=models.BooleanField()
    hero=models.ForeignKey('Bookinfo')
