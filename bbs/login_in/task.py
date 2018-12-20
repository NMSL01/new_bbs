



import random

from celery import task
# 发送邮件
from django.core.cache import cache
from django.core.mail import send_mail
from bbs import settings


@task
def send_email(email):
    # 验证马生成
    checkcode = ''
    for i in range(4):
        current = random.randrange(0, 4)  # 生成随机数与循环次数比对
        current1 = random.randrange(0, 4)
        if current == i:
            tmp = chr(random.randint(65, 90))  # 65~90为ASCii码表A~Z
        elif current1 == i:
            tmp = chr(random.randint(97, 122))  # 97~122为ASCii码表a~z
        else:
            tmp = random.randint(0, 9)
        checkcode += str(tmp)
    subject = '密码'	#主题
    message = '%s'%checkcode#内容
    sender = settings.EMAIL_FROM		#发送邮箱，已经在settings.py设置，直接导入
    receiver = [email]		#目标邮箱
    html_message = '<h1>验证:%s</h1>'%checkcode#发送html格式
    try:
        send_mail(subject,message,sender,receiver,html_message=html_message)
        # 验证码放入缓存10s
        print('hehe')
        cache.set(email,checkcode,90)
    except Exception as e:
        print(e)