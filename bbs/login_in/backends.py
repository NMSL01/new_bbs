from .models import User
from django.http import *
class Emailreset():
    def authenticate(self,request,**email):
        #获得邮箱名或用户名
        email_1=email.get('email',email.get('username'))
        try:
            #拿到User用户名对象
            user=User.objects.get(email=email_1)
        except:
            pass
        else:
            #判断密码
            if user.check_password(email['password']):
                return user

    #必要函数
    def get_user(self,user_id):
        try:
            return User.objects.get(pk=user_id)
        except User.DoesNotExist:
            return None
