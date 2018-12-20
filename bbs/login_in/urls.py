from django.conf.urls import url
from login_in import views
from bbs import settings

urlpatterns=[
    # url(r'^register$',views.register,name='register'),
    url(r'^register$',views.send.as_view(),name='register'),
    url(r'^login$',views.login.as_view(),name='login'),
    url(r'^login/out$',views.login_out,name='out'),
    url(r'^login/newpassword/$',views.newpassword.as_view(),name='newpassword'),
    #验证码自带视图，不需要写视图函数
]
