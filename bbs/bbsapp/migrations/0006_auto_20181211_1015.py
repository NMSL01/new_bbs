# -*- coding: utf-8 -*-
# Generated by Django 1.11 on 2018-12-11 02:15
from __future__ import unicode_literals

from django.conf import settings
from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        migrations.swappable_dependency(settings.AUTH_USER_MODEL),
        ('bbsapp', '0005_auto_20181210_1757'),
    ]

    operations = [
        migrations.AddField(
            model_name='to_comment',
            name='to_user',
            field=models.ForeignKey(null=True, on_delete=django.db.models.deletion.CASCADE, related_name='to_user', to=settings.AUTH_USER_MODEL),
        ),
        migrations.AlterField(
            model_name='to_comment',
            name='user',
            field=models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, related_name='this_user', to=settings.AUTH_USER_MODEL),
        ),
    ]
