from django.conf.urls import url
from booktest import views
urlpatterns=[
    url(r'^$',views.index),
    url(r'^(\d+)',views.show,name="show"),
    url(r'^index2',views.index2),
    url(r'^index3',views.index3),
    url(r'^zhuanyi',views.zhuanyi),
]