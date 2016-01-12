# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('idea', '0005_idea_user'),
    ]

    operations = [
        migrations.AddField(
            model_name='idea',
            name='votes',
            field=models.IntegerField(default=0),
            preserve_default=False,
        ),
    ]
