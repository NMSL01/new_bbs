from django.db import models

# Create your models here.

class comment(models.Model):
    name=models.CharField(max_length=100)
    email=models.EmailField(max_length=150)
    url=models.URLField(blank=True)
    content=models.TextField()
    #创建对象自动生成当前时间
    create_time=models.DateTimeField(auto_now_add=True)
    post=models.ForeignKey('blogapp.Post')
    def __str__(self):
        return self.content[:20]

