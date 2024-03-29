# Generated by Django 2.2.10 on 2021-03-24 23:59

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('api', '0032_auto_20210321_0046'),
    ]

    operations = [
        migrations.AlterField(
            model_name='answer',
            name='answer',
            field=models.TextField(db_index=True, verbose_name='Ответ'),
        ),
        migrations.AlterField(
            model_name='question',
            name='question_text',
            field=models.TextField(db_index=True, default=None, verbose_name='Текст вопроса'),
        ),
        migrations.AlterField(
            model_name='survey',
            name='name',
            field=models.CharField(db_index=True, max_length=50, verbose_name='Название опроса'),
        ),
    ]
