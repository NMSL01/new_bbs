import re
from django.template import Library
from login_in import models
from bbsapp import models as mo

register=Library()

# 获得user对象
@register.simple_tag
def get_user(id):
    return models.User.objects.get(pk=id)


# 获得前25内容
@register.simple_tag
def get_content(text):
    content=re.findall('<img src="/media/.{1,60}/>',text)
    if content:
        return ''.join(content[:3])
    else:
        return text[:25]+'.....'

# 获得最新评论内容
@register.simple_tag
def get_comment(list):
    # 处理回复我的数据
    if list.to_comment:
        return chuli(list,list.to_comment)
    # 处理我的评论数据
    if list.comment:
        return chuli(list,list.comment)
def chuli(list,to_or):
    comment=mo.Comment.objects.get(id=to_or)
    content=comment.content
    # 判断是否在我的帖子中回复我
    sign=None
    if list.user == comment.article.user:
        article=comment.article
        category=comment.article.category
        sign=1
    else:
        article=comment.article
        category=comment.article.category
        sign=2
    return {'content':content,'article':article,'category':category,'sign':sign}

#     获得历史记录
@register.simple_tag
def get_article(user):
    a=[]
    for i in user.history_set.all():
        article=mo.Article.objects.get(id=i.article_history)
        a.append((i.startime,article.title,article))
    return a




