from django.conf.urls import url

from . import views

urlpatterns=[
    url(r'^index/home/(?P<pk>\d*)$',views.index.as_view(),name='index'),
    url(r'^index/home/to_comment/$',views.newcomment.as_view(),name='newcomment'),
    url(r'^index/home/history/$',views.history,name='history'),
]
