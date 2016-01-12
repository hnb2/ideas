# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('idea', '0008_idea_updated_date'),
    ]

    operations = [
        migrations.AlterField(
            model_name='idea',
            name='updated_date',
            field=models.DateTimeField(null=True),
        ),
    ]
