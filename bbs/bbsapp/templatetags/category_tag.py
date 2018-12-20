from bbsapp import models
from django import template

register=template.Library()

@register.simple_tag
def get_category_id():
    return models.Category.objects.all()

@register.simple_tag
def index(only_image,num):
    return only_image[num]

@register.simple_tag
def article(id):
    return id.article

