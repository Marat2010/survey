# Generated by Django 2.2.10 on 2021-03-07 15:59

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('api', '0015_auto_20210306_2355'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='question',
            name='answers',
        ),
        migrations.AddField(
            model_name='answer',
            name='questions',
            field=models.ManyToManyField(blank=True, null=True, related_name='answers', to='api.Question', verbose_name='Вопросы'),
        ),
    ]
