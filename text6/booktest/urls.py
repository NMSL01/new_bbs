from django.conf.urls import url
from booktest import views
urlpatterns=[
    url(r"^$",views.index,name='index'),
    url(r"^pa$",views.extends),
    url(r"^pa1$",views.child1),
    url(r"^zhuan$",views.zhuanyi),
    url(r"^jiexi$",views.jiexi),
    url(r"^statics$",views.statics),
    url(r"^load$",views.load),
    url(r"^down$",views.down),
    url(r"^page(\d*)$",views.page),
    url(r"^ajax$",views.ajax1),
    url(r"^ajax(\d+)$",views.ajax),
]