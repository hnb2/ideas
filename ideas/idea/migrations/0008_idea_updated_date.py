# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations
import datetime
from django.utils.timezone import utc


class Migration(migrations.Migration):

    dependencies = [
        ('idea', '0007_auto_20150928_1334'),
    ]

    operations = [
        migrations.AddField(
            model_name='idea',
            name='updated_date',
            field=models.DateTimeField(default=datetime.datetime(2015, 11, 11, 14, 7, 2, 643829, tzinfo=utc)),
            preserve_default=False,
        ),
    ]
