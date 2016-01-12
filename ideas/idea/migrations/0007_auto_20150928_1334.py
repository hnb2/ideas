# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations
from django.conf import settings


class Migration(migrations.Migration):

    dependencies = [
        migrations.swappable_dependency(settings.AUTH_USER_MODEL),
        ('idea', '0006_idea_votes'),
    ]

    operations = [
        migrations.CreateModel(
            name='UserIdeaVote',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
                ('vote', models.IntegerField()),
                ('idea', models.ForeignKey(to='idea.Idea')),
                ('user', models.ForeignKey(to=settings.AUTH_USER_MODEL)),
            ],
        ),
        migrations.AlterUniqueTogether(
            name='userideavote',
            unique_together=set([('idea', 'user')]),
        ),
    ]
