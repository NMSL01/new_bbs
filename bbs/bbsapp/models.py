from django.db import models
from django.urls import reverse
from bbs import settings
from ckeditor_uploader.fields import RichTextUploadingField

# 帖子表
class Article(models.Model):
    # 标题
    title = models.CharField(max_length=200,unique=False)
    # 所属板块
    category = models.ForeignKey('Category')
    # 作者
    user = models.ForeignKey(settings.AUTH_USER_MODEL)
    # 内容
    content = models.TextField(max_length=2000)
    # 日期
    startime = models.DateTimeField(auto_now_add=True, null=True)
    # 优先级
    dengji = models.IntegerField(default=10)
    # 点击量,内置获取点击函数
    click_count=models.PositiveIntegerField(default=0)
    # 由文章对象获得文章的url
    def get_absolute_url(self):
        return  reverse('bbsapp:comment',kwargs={'pk':self.pk})

    # 阅读量函数
    def count(self):
        self.click_count+=1
        # 值更新阅读量
        self.save(update_fields=['click_count'])
    def __str__(self):
        return str(self.pk)
    # 我的评论


class Comment(models.Model):
    # 当前评论的对象
    user = models.ForeignKey(settings.AUTH_USER_MODEL)
    # 评论的文章
    article = models.ForeignKey('Article')
    # 评论时间
    startime = models.DateTimeField(auto_now_add=True)
    # 评论内容
    content = models.TextField(max_length=1000)
    # 评论的谁，父id
    father_id = models.CharField(max_length=80, null=True, blank=True)
    # 所属楼层id
    floor_id = models.CharField(max_length=80, null=True, blank=True)


# 被评论
class to_Comment(models.Model):
    # 用户
    user = models.ForeignKey(settings.AUTH_USER_MODEL,related_name='this_user')
    # 评论id
    comment = models.CharField(max_length=20, default='', null=True)
    # 被评论
    to_comment = models.CharField(max_length=20, default='', null=True)
    #时间
    startime=models.DateTimeField(auto_now_add=True,null=True,blank=True)
    #评论谁
    to_user=models.ForeignKey(settings.AUTH_USER_MODEL,related_name='to_user',null=True,)

# 关注
class like(models.Model):
    # 用户
    user = models.ForeignKey(settings.AUTH_USER_MODEL)
    # 评论id
    like = models.CharField(max_length=20, default='', null=True, blank=True)
    # 被评论
    to_like = models.CharField(max_length=20, default='', null=True, blank=True)


# 板块
class Category(models.Model):
    # 版快名
    name = models.CharField(max_length=30)
    # 根据板块对象获得板块url
    def get_absolute_url(self):
        return reverse('bbsapp:category_index',kwargs={'pk':self.pk})

    # 由当前板块id对应的url,指向提交函数
    def get_absolute_url2(self):
        return reverse('bbsapp:article_submit',kwargs={'pk':self.pk})


# 收藏
class Collection(models.Model):
    # 收藏状态
    collection = models.BooleanField(default=False)
    # 对应文章
    article = models.ForeignKey('Article', null=True)
    # 对应用户
    user = models.ForeignKey(settings.AUTH_USER_MODEL)
    # 时间
    startime = models.DateTimeField(auto_now_add=True, null=True)


class good(models.Model):
    # 点赞状态,
    click_good = models.BooleanField(default=False)
    # 对应文章
    article = models.ForeignKey('Article', null=True)
    # 时间
    startime = models.DateTimeField(auto_now_add=True, null=True)
    # 用户
    user = models.ForeignKey(settings.AUTH_USER_MODEL)
# Create your models here.
