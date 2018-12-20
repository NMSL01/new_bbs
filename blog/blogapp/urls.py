from django.conf.urls import url
from blogapp import views
urlpatterns=[
    url(r'^$',views.indexview.as_view(),name='index'),
    url(r'^post/(?P<pk>[0-9]+)/$',views.detail,name='detail'),
    url(r'^post/(?P<year>[0-9]{4})(?P<month>[0-9]+)$',views.guidang,name='guidang'),
    url(r'^post/(?P<pk>[0-9]+)$',views.categoryview.as_view(),name='fenlei'),
    url(r'^post/tag/(?P<pk>[0-9]+)$',views.tag,name='tag'),
]