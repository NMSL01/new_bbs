from django.conf.urls import url
from comment import views
urlpatterns=[
    url(r'^comment/(\d+)',views.post_comment,name='post_comment'),
]