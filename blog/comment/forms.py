from django import forms
from .models import *
#定义表单类
class commentForms(forms.ModelForm):
    class Meta():
        #表单对应模型类
        model=comment
        #表单显示的字段
        fields=['name','email','url','content']

