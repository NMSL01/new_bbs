from django.contrib import admin
from booktest.models import HeroInfo
# Register your models here.
# class inline(admin.TabularInline):
#     model=models.Heroinfo
#     extra=3
class showcontext(admin.ModelAdmin):
    list_display=['id','btitle']
    list_filter=['btitle']
    search_fields=["btitle"]
    fieldsets=[
        ('one',{'fields':['btitle']}),
        ('tow',{'fields':['datetime']})
    ]
    list_per_page=10
    # inlines=[inline]
admin.site.register(HeroInfo,showcontext)
