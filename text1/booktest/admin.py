from django.contrib import admin
import booktest.models

#关联添加
class inline(admin.TabularInline):
    model=booktest.models.Heroinfo
    extra=3

#注册表显示的内容
@admin.register(booktest.models.Bookinfo)
class bookinfoAdmin(admin.ModelAdmin):
    #显示的字段
    list_display=['id','btitle','datetime']
    #右侧显示列
    list_filter=['btitle']
    #筛选功能
    search_fields=['btitle','datetime']
    #分页
    list_per_page=10
    #修改时分组
    fieldsets=[
        ('title',{'fields':['btitle']}),
        ('mation',{'fields':['datetime']})
    ]
    #登记关联添加的类
    inlines=[inline]

#注册表
# admin.site.register(booktest.models.Bookinfo,bookinfoAdmin)
admin.site.register(booktest.models.Heroinfo)

# Register your models here.
