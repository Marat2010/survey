# Generated by Django 2.2.10 on 2021-03-04 19:50

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('api', '0004_auto_20210304_2159'),
    ]

    operations = [
        migrations.CreateModel(
            name='Answer',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('answer', models.TextField(blank=True, null=True, verbose_name='Ответ')),
            ],
            options={
                'verbose_name': 'Ответ',
                'verbose_name_plural': 'Ответы',
                'ordering': ['answer'],
            },
        ),
        migrations.AlterField(
            model_name='question',
            name='type_question',
            field=models.BooleanField(blank=True, null=True, verbose_name='Тип вопроса(None-вручную, False-один ответ, True-несколько ответов'),
        ),
        migrations.AddField(
            model_name='question',
            name='answers',
            field=models.ManyToManyField(related_name='questions', to='api.Answer', verbose_name='Ответы'),
        ),
    ]