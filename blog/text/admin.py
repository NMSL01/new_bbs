from django.contrib import admin
from text import models
# Register your models here.
class show(admin.ModelAdmin):
    list_display=['d1','d2','d3']
    list_filter=['d1']
    search_fields=['d1']
    list_per_page=10
admin.site.register(models.bbs,show)