# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('idea', '0009_auto_20151111_1421'),
    ]

    operations = [
        migrations.AddField(
            model_name='idea',
            name='excerpt',
            field=models.CharField(default='', max_length=200),
            preserve_default=False,
        ),
    ]
