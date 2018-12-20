msg_list = [
    {'id': 1, 'content': 'xxx', 'parent_id': None, },
    {'id': 2, 'content': 'xxx', 'parent_id': None, },
    {'id': 3, 'content': 'xxx', 'parent_id': None, },
    {'id': 4, 'content': 'xxx', 'parent_id': 1, },
    {'id': 5, 'content': 'xxx', 'parent_id': 4, },
    {'id': 6, 'content': 'xxx', 'parent_id': 2, },
    {'id': 7, 'content': 'xxx', 'parent_id': 5, },
    {'id': 8, 'content': 'xxx', 'parent_id': 3, },
]
msg_2_list = {}
for i in msg_list:
    i['child'] = []
    msg_2_list[i['id']] = i
result = []
for item in msg_list:
    if item['parent_id']:
        msg_2_list[item['parent_id']]['child'].append(item)
    else:
        result.append(item)

print(result)

import datetime
newres_list = [{'id': 6,
  'user_id': 1,
  'article_id': 1,
  'startime': datetime.datetime(2018, 11, 27, 11, 3, 39, 896258, tzinfo=<UTC>),
  'content': '第一条评论第一条评论第一条评论\r\n第一条评论第一条评论第一条评论\r\n第一条评论第一条评论第一条评论',
  'father_id': '',
  'this_id': '6'},
 {'id': 7,
  'user_id': 1,
  'article_id': 1,
  'startime': datetime.datetime(2018, 11, 27, 11, 4, 45, 569742, tzinfo=<UTC>),
  'content': '第2条评论第2条评论第2条评论第2条评论\r\n第2条评论第2条评论第2条评论第2条评论',
  'father_id': '',
  'this_id': '7'},
 {'id': 8,
  'user_id': 1,
  'article_id': 1,
  'startime': datetime.datetime(2018, 11, 27, 11, 5, 10, 721152, tzinfo=<UTC>),
  'content': '第3条评论第3条评论第3条评论\r\n第3条评论第3条评论第3条评论\r\n第3条评论第3条评论第3条评论',
  'father_id': '',
  'this_id': '8'},
 {'id': 9,
  'user_id': 2,
  'article_id': 1,
  'startime': datetime.datetime(2018, 11, 27, 11, 6, 12, 72925, tzinfo=<UTC>),
  'content': '1------的子评论',
  'father_id': '6',
  'this_id': '9'},
 {'id': 10,
  'user_id': 2,
  'article_id': 1,
  'startime': datetime.datetime(2018, 11, 27, 11, 6, 52, 706025, tzinfo=<UTC>),
  'content': '1---------1----------1',
  'father_id': '9',
  'this_id': '10'},
 {'id': 11,
  'user_id': 1,
  'article_id': 1,
  'startime': datetime.datetime(2018, 11, 27, 11, 7, 43, 841309, tzinfo=<UTC>),
  'content': '1---------2',
  'father_id': '6',
  'this_id': '11'},
 {'id': 12,
  'user_id': 1,
  'article_id': 1,
  'startime': datetime.datetime(2018, 11, 27, 11, 8, 2, 170625, tzinfo=<UTC>),
  'content': '1------------3',
  'father_id': '6',
  'this_id': '11'},
 {'id': 13,
  'user_id': 1,
  'article_id': 1,
  'startime': datetime.datetime(2018, 11, 27, 11, 8, 17, 385118, tzinfo=<UTC>),
  'content': '1------------------------------4',
  'father_id': '6',
  'this_id': '12'},
 {'id': 14,
  'user_id': 1,
  'article_id': 1,
  'startime': datetime.datetime(2018, 11, 27, 11, 8, 50, 315994, tzinfo=<UTC>),
  'content': '1------------------------------------5',
  'father_id': '7',
  'this_id': '14'}]

    
print(newres_list)
