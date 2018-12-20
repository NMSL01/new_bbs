from django.conf.urls import include ,url
import booktest.views
urlpatterns=[
    url(r'^$',booktest.views.index),
    url(r'^(\d+)$',booktest.views.show),
]


