from django.conf.urls import url
from bbsapp import views

urlpatterns=[
    url(r'^$',views.index,name='index'),
    # url(r'^comment$',views.comment,name='comment'),
    # 楼钟楼5条展示评论
    url(r'^comment/this_comment$',views.this_comment,name='this_comment'),
    # 楼钟楼提交
    url(r'^comment/submit$',views.comment_submit,name='comment_submit'),
    # 楼钟楼分页
    url(r'^comment/paginator$',views.comment_paginator,name='comment_paginator'),
    # 评论主页
    url(r'^comment/(?P<pk>\d*)$',views.comment.as_view(),name='comment'),
    # 文章图片
    url(r'^kind/upload',views.kind_upload,name='kind_upload'),
    # 文章提交
    url(r'^comment/article_submit/(?P<pk>\d)$',views.article_submit,name='article_submit'),
    # 板块主页,放入板块id作参数
    url(r'^category/index/(?P<pk>\d+)',views.category_index.as_view(),name='category_index'),
    #搜索
    url(r'^mysearch/$',views.mysearch,name='mysearch'),
    # 多图
    # url(r'^webuploader',views.webuploader,name='webuploader'),
#     个人空间
]