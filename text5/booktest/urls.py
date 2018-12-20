from django.conf.urls import url
from booktest import views
urlpatterns=[
    url(r'^$',views.index),
    url(r'^load/$',views.load),
    url(r'^sumbit$',views.sumbit),
    url(r'^page/(\d*)$',views.page),
    url(r'^area$',views.area),
    url(r'^area/(\d+)$',views.area0)
]