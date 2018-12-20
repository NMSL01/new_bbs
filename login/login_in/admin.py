from django.contrib import admin
from login_in import models
# Register your models here.
class showmodel(admin.ModelAdmin):
    list_display=['id','username','email']
    list_filter=['username']
    search_fields=['username']
    list_per_page=10
admin.site.register(models.User,showmodel)