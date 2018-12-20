# -*- coding: utf-8 -*-
# Generated by Django 1.11 on 2018-12-10 09:57
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('bbsapp', '0004_article_click_count'),
    ]

    operations = [
        migrations.AddField(
            model_name='to_comment',
            name='startime',
            field=models.DateTimeField(auto_now_add=True, null=True),
        ),
        migrations.AlterField(
            model_name='article',
            name='click_count',
            field=models.PositiveIntegerField(default=0),
        ),
    ]
