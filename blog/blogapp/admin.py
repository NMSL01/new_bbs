from django.contrib import admin
from blogapp import models
# Register your models here.



class showadmin(admin.ModelAdmin):
    list_display=['id','title','content','startime','endtime','other']
    list_filter=['title']
    search_fields=['title']
    list_per_page=10
    # inlines=[inline]
admin.site.register(models.Post,showadmin)
admin.site.register(models.Tag)
admin.site.register(models.Category)
