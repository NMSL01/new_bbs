from django.conf.urls import url
from text import views
urlpatterns=[
    url('^bbs$',views.index,name='index'),
    url('^next(\d+)$',views.index_2,name='index_2'),
]