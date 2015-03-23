# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
    ]

    operations = [
        migrations.CreateModel(
            name='Character',
            fields=[
                ('char_id', models.AutoField(primary_key=True, serialize=False)),
                ('name', models.CharField(unique=True, max_length=255)),
                ('code', models.CharField(unique=True, max_length=40)),
            ],
            options={
                'db_table': 'character',
            },
            bases=(models.Model,),
        ),
    ]
