# -*- coding: utf-8 -*-
# Generated by Django 1.11 on 2018-11-22 10:51
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('login_in', '0001_initial'),
    ]

    operations = [
        migrations.AlterField(
            model_name='user',
            name='email',
            field=models.EmailField(error_messages={'unique': '该邮箱地址已被占用。'}, max_length=254, unique=True, verbose_name='邮箱'),
        ),
    ]
