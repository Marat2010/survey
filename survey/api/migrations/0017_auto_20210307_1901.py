# Generated by Django 2.2.10 on 2021-03-07 16:01

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('api', '0016_auto_20210307_1859'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='answer',
            name='questions',
        ),
        migrations.AddField(
            model_name='answer',
            name='questions',
            field=models.ForeignKey(default='', on_delete=django.db.models.deletion.CASCADE, related_name='answers', to='api.Question', verbose_name='Вопросы'),
            preserve_default=False,
        ),
    ]