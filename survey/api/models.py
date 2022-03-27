from django.db import models
from django.core.exceptions import ValidationError, FieldError
from django.http import Http404
from django.shortcuts import get_object_or_404
from django.core.exceptions import ValidationError, FieldError
from django.db.models.signals import m2m_changed
from django.dispatch import receiver


class Survey(models.Model):
    name = models.CharField(max_length=50, db_index=True, verbose_name='Название опроса')
    date_start = models.DateTimeField(db_index=True, verbose_name='Дата старта опроса')
    date_end = models.DateTimeField(db_index=True, default=None, verbose_name='Дата окончания опроса')
    description = models.CharField(max_length=500, default=None, verbose_name='Описание опроса')
    # description = models.TextField(default=None, verbose_name='Описание опроса')
    questions = models.ManyToManyField('Question', related_name='surveys', verbose_name='Вопросы')

    def __str__(self):
        return f"{str(self.pk)}: {self.name}"

    # def get_questions(self):
    #     return ';  '.join(['{} '.format(str(question.question_text)) for question in self.questions.all()])

    class Meta:
        verbose_name_plural = 'Опросы'
        verbose_name = 'Опрос'
        ordering = ['pk']


class Question(models.Model):
    TYPE_ANSWER = [
        ('0', 'Свой ответ'),
        ('1', 'Выбор одного ответа'),
        ('2', 'Выбор нескольких ответов'),
    ]
    question_text = models.CharField(max_length=500, default=None, db_index=True, verbose_name='Текст вопроса')
    # question_text = models.TextField(default=None, db_index=True, verbose_name='Текст вопроса')
    type_answer = models.CharField(choices=TYPE_ANSWER, default='0', max_length=1, verbose_name='Тип ответа')
    answers = models.ManyToManyField('Answer', blank=True, default=None, related_name='questions', verbose_name='Ответы')
    # answers = models.ManyToManyField('Answer', default=None, related_name='questions', verbose_name='Ответы')

    def __str__(self):
        return f"{self.type_answer} - {self.question_text}"

    class Meta:
        verbose_name_plural = 'Вопросы'
        verbose_name = 'Вопрос'
        ordering = ['pk']

    # def get_answers(self):
    #     return ['{}'.format(str(answer.answer)) for answer in self.answers.all()]


# ------------------------------------------------------------------------
# @receiver(m2m_changed, sender=Question.answers.through)
# def question_answers_changed(sender, **kwargs):
#     print('=====1======== ', kwargs)
#     action = kwargs.pop('action', None)
#     pk_set = kwargs.pop('pk_set', None)  # set of ID answers
#     instance = kwargs.pop('instance', None)
#     type_answer = int(instance.type_answer)
#
#     if action == "pre_add":  # Проверка на выборку ответов
#         print(f'---- Values 1-- pk_set:  {pk_set}  action: {action}----')
#         print(f'------Values 2-- len answ: {len(pk_set)}- type_answer: {type_answer} ')
#         if (len(pk_set) > 0 and type_answer == 0) or\
#                 (len(pk_set) <= 1 and type_answer != 0):
#             raise FieldError("!!! Не соответствие типа ответа и кол-ва ответов !!!")
# -------------------------------------


class Answer(models.Model):
    """ Все возможные ответы, включая ответы пользователей """
    answer = models.CharField(max_length=500, verbose_name='Ответ', db_index=True)
    # answer = models.TextField(verbose_name='Ответ', db_index=True)
    # answer = models.TextField(default=None, verbose_name='Ответ')

    def __str__(self):
        return self.answer

    class Meta:
        verbose_name_plural = 'Ответы'
        verbose_name = 'Ответ'
        ordering = ['pk']


class User(models.Model):
    name = models.CharField(max_length=50, blank=True, null=True, default=None, verbose_name='Имя пользователя')

    def __str__(self):
        return f"{str(self.pk)}: {self.name}"

    class Meta:
        verbose_name_plural = 'Пользователи'
        verbose_name = 'Пользователь'
        ordering = ['pk']


class UserAnswer(models.Model):
    user = models.ForeignKey(User, related_name='user_answers', on_delete=models.CASCADE, verbose_name='ID Пользователя')
    survey = models.ForeignKey(Survey, related_name='user_answers', on_delete=models.PROTECT, verbose_name='Опросник')
    question = models.ForeignKey(Question, related_name='user_answers', on_delete=models.PROTECT, verbose_name='Вопрос')
    # answer = models.ForeignKey(Answer, related_name='user_answers', on_delete=models.PROTECT, verbose_name='Ответ')
    #                            # , blank=True, null=True)
    answer = models.ManyToManyField(Answer, related_name='user_answers', verbose_name='Ответы')

    class Meta:
        verbose_name_plural = 'Ответы Пользователей'
        verbose_name = 'Ответ Пользователя'
        ordering = ['pk']

    # def get_answers(self):
    #     return ['{}'.format(str(i.answer)) for i in self.answer.all()]


# # ------------ Ответы на опросы -------------------------------------
# class SurveyAnswer(models.Model):
#     user = models.ForeignKey(User, related_name='survey_answers', on_delete=models.CASCADE, verbose_name='ID Пользователя')
#     survey = models.ForeignKey(Survey, related_name='survey_answers', on_delete=models.PROTECT, verbose_name='Опросник')
#     questions = models.ManyToManyField('Question', related_name='survey_answers', verbose_name='Вопросы')
#     answer = models.ManyToManyField(Answer, related_name='survey_answers', verbose_name='Ответы')
#
#     def __str__(self):
#         return f"{str(self.pk)}: {self.user}:{self.survey_id}"
#
#     class Meta:
#         verbose_name_plural = 'Ответы на опрос'
#         verbose_name = 'Ответ на опрос'
#         ordering = ['pk']
#
#
#     # answer = models.ForeignKey(Answer, related_name='survey_answers', verbose_name='Ответы')
#     # question = models.ForeignKey(Question, related_name='survey_answers', on_delete=models.PROTECT, verbose_name='Вопрос')
# # ------------ END Ответы на опросы -------------------------------------



# --------------------------------------------
# --------------------------------------------
        # return self.name
# --------------------------------------------
        # return ';  '.join(['{} '.format(str(answer.answer)) for answer in self.answers.all()])
        # return str(self.answers)
            # raise Http404("==!!! Inconsistency between the type of question and the number of answers!!!==")
            # get_object_or_404(MyModel, pk=1)
            # raise ValidationError("Не соответствие типа вопроса и кол-ва ответов ===========")


# --------------------------------
#     def clean(self):
#         print('////////////////', self.type_answer,
#               type(self.type_answer))
#         print('////////11 ////////', self.__dir__())
#         print('////////22 ////////', self.__dict__)
#         # print('////////11 ////////', self.get_answers(self))
#         if int(self.type_answer) == 1:
#             print('////// 2 //////////', self.type_answer)
#             raise ValidationError("Не соответствие типа вопроса и кол-ва ответов ===========")
#             # raise Exception('Не соответствие типа вопроса и кол-ва ответов')

# ----------------------------------------------
    # @classmethod
    # def create(cls, question_text):
    #     question = cls(question_text=question_text)
    #     print('++++++++++ CREATE ```` ++++ ', question)
    #     # do something with the question
    #
    #     return question
# --------------------------------------------
    # def _check_property_name_related_field_accessor_clashes(self):
    #     qq = self.get_answers(object)
    #     print('=========111====', qq)

    # def save(self, *args, **kwargs):
    #     sp = super().save(*args, **kwargs)
    #     self.answers.update()
    #     print('++++++ SAVE----- ', sp, self.type_answer, self.answers, self.get_answers())
    #     if self.type_answer == 0 and len(self.answers) > 0:
    #         raise Exception('Не соответствие типа вопроса и кол-ва ответов')
    #     if self.type_answer == 1 and len(self.answers) != 1:
    #         raise Exception('Не соответствие типа вопроса и кол-ва ответов')
    #         # return  # Yoko shall never have her own blog!
    #     else:
    #         super().save(*args, **kwargs)  # Call the "real" save() method.
# --------------------------------------------
        # unique_together = ['questions', 'name']
        # unique_together = ['name']
# --------------------------------------------
    # type_answer = models.BooleanField(blank=True, null=True, default=None,
    #                                     verbose_name='Тип вопроса(None-вручную, '
    #                                                  'False-один ответ, True-несколько ответов')
# return '{}, {}'.format(self.pk, self.answer)

# --------------------------------------------
    # answers = models.ForeignKey('Answer', blank=True, null=True, default=None, related_name='questions', on_delete=models.PROTECT, verbose_name='Ответы')

    # answers = models.ManyToManyField('Answer', related_name='questions', verbose_name='Ответы')

    # objects = models.Manager()  # The default manager.
    # survey_objects = QuestionManager()  # The Survey-specific manager.
# --------------------------------------------
    # answer = models.TextField(blank=True, null=True, default=None, verbose_name='Ответ')
    # questions = models.ForeignKey(Question, related_name='answers', on_delete=models.PROTECT, verbose_name='Вопросы')
    # questions = models.ManyToManyField(Question, blank=True, null=True, related_name='answers', verbose_name='Вопросы')
# --------------------------------------------

#     def get_surveys(self):
#         # return ';  '.join(['{} ({})'.format(str(recr.name), recr.email) for recr in self.recruits.all()])
#         return ';  '.join(['{} '.format(str(survey.name)) for survey in self.surveys.all()])
#
#     def get_answers(self):
#         # return ';  '.join(['{} ({})'.format(str(recr.name), recr.email) for recr in self.recruits.all()])
#         return ';  '.join(['{} '.format(str(answer.answer)) for answer in self.answers.all()])
#
#
#     # def get_questions(self):
#     #     return ';  '.join(['{} '.format(str(question.question_text)) for question in self.questions.all()])
#
#     def __str__(self):
#         return self.pk
#
#     class Meta:
#         verbose_name_plural = 'Ответы пользователей'
#         verbose_name = 'Ответ пользователя'
#         ordering = ['pk']

# ------------------------------------------------
# class QuestionManager(models.Manager):
#     def get_queryset(self):
#         # queryset = super(QuestionManager, self).get_queryset().filter(questions=self.kwargs['pk'])
#         queryset = super(QuestionManager, self).get_queryset().filter(pk=4)
#         return queryset

# ------------------------------------------------
    # surveys = models.ManyToManyField(Survey, blank=True, null=True, related_name='users', verbose_name='Опросы')
# ------------------------------------------------
    # date_start = models.DateTimeField(db_index=True, verbose_name='Дата старта опроса', default=timezone.now)
    # date_end = models.DateTimeField(blank=True, null=True, db_index=True, verbose_name='Дата окончания опроса', default=timezone.now)
# ------------------------------------------------
#     # surveys = models.ForeignKey(Survey, blank=True, null=True, related_name='users', on_delete=models.CASCADE, verbose_name='Опросы')
#     questions = models.ManyToManyField(Question, related_name='users', verbose_name='Вопросы')
#     # questions = models.ForeignKey(Question, related_name='users', on_delete=models.CASCADE, verbose_name='Вопросы')
#     answers = models.ManyToManyField(Answer, related_name='users', verbose_name='Ответы')
# ------------------------------------------------
    # surveys = models.ManyToManyField(Survey, related_name='questions', verbose_name='Опросы')
    # answers = models.ManyToManyField('Answer', blank=True, null=True, related_name='questions', verbose_name='Ответ, ответы')

