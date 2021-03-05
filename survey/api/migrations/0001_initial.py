# Generated by Django 2.2.10 on 2021-03-04 15:57

from django.db import migrations, models


class Migration(migrations.Migration):

    initial = True

    dependencies = [
    ]

    operations = [
        migrations.CreateModel(
            name='Answer',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('answer', models.TextField(blank=True, null=True, verbose_name='Ответ')),
            ],
        ),
        migrations.CreateModel(
            name='Question',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('question_text', models.TextField(verbose_name='Текст вопроса')),
                ('type_question', models.BooleanField(blank=True, null=True, verbose_name='Тип вопроса')),
                ('answers', models.ManyToManyField(blank=True, null=True, related_name='questions', to='api.Answer', verbose_name='Вопрос')),
            ],
        ),
        migrations.CreateModel(
            name='Survey',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('name', models.CharField(max_length=50, verbose_name='Название опроса')),
                ('date_start', models.DateTimeField(db_index=True, verbose_name='Дата старта опроса')),
                ('date_end', models.DateTimeField(blank=True, db_index=True, null=True, verbose_name='Дата окончания опроса')),
                ('description', models.TextField(blank=True, null=True, verbose_name='Описание опроса')),
            ],
        ),
        migrations.CreateModel(
            name='User',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('answers', models.ManyToManyField(related_name='users', to='api.Answer', verbose_name='Ответы')),
                ('questions', models.ManyToManyField(related_name='users', to='api.Question', verbose_name='Ответы')),
                ('surveys', models.ManyToManyField(blank=True, null=True, related_name='users', to='api.Survey', verbose_name='Опросы')),
            ],
        ),
        migrations.AddField(
            model_name='question',
            name='surveys',
            field=models.ManyToManyField(related_name='questions', to='api.Survey', verbose_name='Опросы'),
        ),
    ]