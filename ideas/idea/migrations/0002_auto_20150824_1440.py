# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('idea', '0001_initial'),
    ]

    operations = [
        migrations.RenameField(
            model_name='idea',
            old_name='date',
            new_name='created_date',
        ),
    ]
