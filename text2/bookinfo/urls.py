from django.conf.urls import url
from django.contrib import admin
from bookinfo import views
urlpatterns = [
    url(r'^$',views.index)
]
