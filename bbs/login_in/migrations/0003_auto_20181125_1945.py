# -*- coding: utf-8 -*-
# Generated by Django 1.10.1 on 2018-11-25 11:45
from __future__ import unicode_literals

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('login_in', '0002_auto_20181123_1844'),
    ]

    operations = [
        migrations.AlterField(
            model_name='user',
            name='country',
            field=models.ForeignKey(null=True, on_delete=django.db.models.deletion.CASCADE, to='login_in.Country'),
        ),
    ]
