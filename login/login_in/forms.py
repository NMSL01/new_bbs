from django.contrib.auth.forms import UserCreationForm
from .models import *
class registerform(UserCreationForm):
    class Meta(UserCreationForm.Meta):
        #指定自己生成的models对象
        model=User
        #页面中生成的input 控件
        fields=('username','email')