from django.conf.urls import url
from login_in import views
urlpatterns=[
    url(r'^register$',views.register,name='register'),
    # url(r'^login$',views.login,name='register'),
    url(r'^index$',views.index,name='index'),
]