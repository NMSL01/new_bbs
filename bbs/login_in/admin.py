from django.contrib import admin
from login_in import models
# Register your models here.
class showmodel(admin.ModelAdmin):
    list_display=['id','username','email']
    list_filter=['username']
    search_fields=['username']
    list_per_page=10

    class Media:
        js = ('/static/kindeditor-all-min.js',
              '/static/lang/zh-CN.js',
              '/static/config.js')


class showhistory(admin.ModelAdmin):
    list_display = ['user','article_history']
    search_fields = ['article_history']
    list_per_page = 10
    list_filter = ['user']

admin.site.register(models.User,showmodel)
admin.site.register(models.history,showhistory)