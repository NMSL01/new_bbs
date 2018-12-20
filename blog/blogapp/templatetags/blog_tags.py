from django import template
from ..models import Post,Category,Tag
from django.db.models import *
'''
显示右侧视图,自定义标签
用来自定义页面中可以执行的标签，先导入template，写函数,装饰函数让django执行
'''
#让页面可以执行函数
register=template.Library()

@register.simple_tag
#获得文章前五个
def get_newtitle(num=5):
    return Post.objects.all().order_by('-startime')[:num]

#按月份归档
@register.simple_tag
def get_guidang():
    return Post.objects.dates('startime','month',order='DESC')

#分类,annotate统计数量的返回结果
@register.simple_tag
def get_category():
    return Category.objects.annotate(num_count=Count('post')).filter(num_count__gt=0)

@register.simple_tag
def get_tag():
    return Tag.objects.annotate(num_count=Count('post')).filter(num_count__gt=0)

