from django.contrib import admin
from bbsapp import models
# Register your models here.
class showuser(admin.ModelAdmin):
    list_display=['id','username','email']
    list_filter=['username']
    search_fields=['username']
    list_per_page=10
class showcate(admin.ModelAdmin):
    list_display=['id','title']
    list_filter=['title']
    search_fields=['title']
    list_per_page=10
    class Media:
        js=(
            '/static/text/js/kindeditor/kindeditor-all-min.js',
            '/static/text/js/kindeditor/lang/zh-CN.js',
            '/static/text/js/kindeditor/config.js',
        )

class showComment(admin.ModelAdmin):
    list_display=['id','user','article','startime','father_id','content','floor_id']
    list_per_page=15
    search_fields=['user']
    list_filter=['article']
    class Media:
            js=(
                '/static/text/js/kindeditor/kindeditor-all-min.js',
                '/static/text/js/kindeditor/lang/zh-CN.js',
                '/static/text/js/kindeditor/config.js',
            )

class showto_comment(admin.ModelAdmin):
    list_display=['user','to_user','comment','to_comment']
    list_filter=['user']
    search_fields=['to_user','user']
    list_per_page=10
admin.site.register(models.Category)
admin.site.register(models.good)
admin.site.register(models.Comment,showComment)
admin.site.register(models.Article,showcate)
admin.site.register(models.Collection)
admin.site.register(models.to_Comment,showto_comment)
admin.site.register(models.like)
