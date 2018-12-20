from django.db import models
from django.contrib.auth.models import User
from django.urls import reverse
import markdown
from django.utils.html import strip_tags


# Create your models here.
# class mymanager(models.Manager):
#     def create(self,s1,s2,s3,s4,s5,s6):
#         b=Post()
#         b.title=s1
#         b.content=s2
#         b.startime=s3
#         b.endtime=s4
#         b.other=s5
#         b.tag=s6
#         return b

#文章分类
class Category(models.Model):
    name=models.CharField(max_length=90)
    def get_absolute_url(self):
        print("ss")
        return reverse('blogapp:fenlei',kwargs={"pk":self.pk})
    def __str__(self):
        return self.name

#文章标签
class Tag(models.Model):
    name=models.CharField(max_length=90)
    def __str__(self):
        return self.name
    def get_absolute_url(self):
        return reverse('blogapp:tag',kwargs={'pk':self.pk})

class Post(models.Model):
    # book1=models.manager.Manager()
    title=models.CharField(max_length=70)
    content=models.TextField()
    startime=models.DateTimeField()
    endtime=models.DateTimeField()
    #摘要
    other=models.CharField(max_length=200,blank=True)
    #外键
    category=models.ForeignKey(Category)
    #与标签多对多
    tag=models.ManyToManyField(Tag,blank=True)
    #作者关联　
    user=models.ForeignKey(User)
    #阅读量
    views=models.PositiveIntegerField(default=0)
    def __str__(self):
        return self.title
    #通过post对象在模板中调用get_absolute_url方法,得到urls中url,并传入post的pk参数
    #直接获取页面，动态拼接url
    def get_absolute_url(self):
        return reverse('blogapp:detail',kwargs={'pk':self.pk})
    
    #定义阅读量方法
    def plus_views(self):
        self.views+=1
        self.save(update_fields=['views'])

    #自动获取摘要{{ post.body|truncatechars:54 }}(过滤器在模板中直接使用)
    def save(self,*args,**kwargs):
        if not self.other:
            md = markdown.Markdown(extensions=[
            'markdown.extensions.extra',
            'markdown.extensions.codehilite',
        ])
            # 先将 Markdown 文本渲染成 HTML 文本
            # strip_tags 去掉 HTML 文本的全部 HTML 标签
            # 从文本摘取前 54 个字符赋给 excerpt
            self.other= strip_tags(md.convert(self.content))[:24]
        super(Post,self).save(*args,**kwargs)


    #定义排序方式
    class Meta:
        ordering=['-startime']
