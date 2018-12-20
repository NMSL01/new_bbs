from django.conf.urls import url
from booktest import views
urlpatterns=[
    url(r'^$',views.getext),
    url(r'^get2/',views.getext2),
    url(r'^get3/',views.getext3),
    url(r'^login/$',views.session_1),
    url(r'^login1/$',views.session_2),
    url(r'^login2/$',views.session_3),
    url(r'^login3/$',views.session_4),
]