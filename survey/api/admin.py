from django.contrib import admin
from django.core.exceptions import ValidationError

from .models import Survey, Question, Answer, User, UserAnswer


class SurveyAdmin(admin.ModelAdmin):
    list_display = ('pk', 'name', 'date_start', 'date_end', 'description', 'get_questions')
    list_display_links = ('pk', 'name', 'description',)
    search_fields = ('name', 'date_start', 'date_end', 'description')
    list_filter = ('date_start', 'date_end',)
    # readonly_fields = ('date_start', 'date_end',)

    def get_questions(self, obj):
        questions = ';\n'.join([question.question_text for question in obj.questions.all()])
        return questions
    get_questions.short_description = "Вопросы"


class QuestionAdmin(admin.ModelAdmin):
    list_display = ('pk', 'question_text', 'type_answer', 'get_answers')
    list_display_links = ('pk', 'question_text',)
    search_fields = ('pk', 'question_text', 'type_answer')
    list_filter = ('type_answer', 'question_text')
    list_editable = ('type_answer',)
    list_per_page = 20

    def get_answers(self, obj):
        answers = '; '.join([answer.answer for answer in obj.answers.all()])
        return answers
    get_answers.short_description = "Ответы"


class AnswerAdmin(admin.ModelAdmin):
    list_display = ('pk', 'answer',)
    list_display_links = ('pk', 'answer',)
    search_fields = ('answer',)
    list_per_page = 20


class UserAdmin(admin.ModelAdmin):
    list_display = ('pk', 'name')
    list_display_links = ('pk', 'name')
    search_fields = ('pk', 'name')


class UserAnswerAdmin(admin.ModelAdmin):
    list_display = ('pk', 'user', 'survey', 'question', 'get_answers')
    list_display_links = ('survey', 'question')
    search_fields = ('pk', 'user', 'survey', 'question')
    list_filter = ('survey', 'user')

    def get_answers(self, obj):
        answers = '; '.join([answer.answer for answer in obj.answer.all()])
        return answers
    get_answers.short_description = "Ответы"


# class SurveyAnswerAdmin(admin.ModelAdmin):
#     list_display = ('pk', 'user', 'survey', 'get_questions', 'get_answers')
#     list_display_links = ('survey',)
#     search_fields = ('pk', 'user', 'survey',)
#     list_filter = ('survey', 'user')
#
#     def get_questions(self, obj):
#         questions = '; '.join([question.question_text for question in obj.questions.all()])
#         return questions
#     get_questions.short_description = "Вопросы"
#
#     def get_answers(self, obj):
#         answers = '; '.join([answer.answer for answer in obj.answer.all()])
#         return answers
#     get_answers.short_description = "Ответы"


admin.site.register(Survey, SurveyAdmin)
admin.site.register(Question, QuestionAdmin)
admin.site.register(Answer, AnswerAdmin)
admin.site.register(User, UserAdmin)
admin.site.register(UserAnswer, UserAnswerAdmin)

# admin.site.register(SurveyAnswer, SurveyAnswerAdmin)

# @staticmethod
# def get_answers(obj):
#     # return ";\n".join([p.answer for p in obj.answers.all()])
#     return [p.answer for p in obj.answers.all()]

# -----------------------------------------------------------
# list_filter = ('pk', 'user', 'survey')
# list_display = ('pk', 'user', 'survey', 'question', 'answer')
# def save_related(self, request, form, formsets, change):
    #     super(QuestionAdmin, self).save_related(request, form, formsets, change)
    #     # count_answer = len(form.instance.get_answers())
    #     count_answer = form.instance.answers
    #     print('-------- 1-------- ', count_answer)
    #     count_answer = len(form.instance.answers)
    #     type_question = int(form.instance.type_question)
    #     print('-----count--- 2---type----- ', count_answer, type_question, type(type_question))
    #
    #     if (count_answer > 0 and type_question == 0) or\
    #             (count_answer <= 1 and type_question != 0):
    #         print('////// 2 //////////', count_answer, type_question,)
    #         raise ValidationError("=== Не соответствие типа вопроса и кол-ва ответов ===")
# -----------------------------------------------------------
# ----------------------------------------------------------------
        # question = Question.objects.get(pk=1)
        # print('=== 1=====', question)
        # print('=== 2=====', form.save_m2m)
        # print('=== 3=====', form.instance.__dir__())
        # print('=== 4=====', form.instance.__dict__)
        # print('=== 5=====', form.instance.get_answers(), len(form.instance.get_answers()))
# -------------------------
    # def save_model(self, request, obj, form, change):
    #     # obj.user = request.user
    #     # super().save_model(request, obj, form, change)


    # def save_related(self, request, form, formsets, change):
    # def save_related(self, request, form, *args, **kwargs):
    #     print('==1==', obj.__dir__())
    #     print('==2==', obj.question_text)
        # print('==3==', obj.type_question)
        # print('==4==', obj.answers)

    # def clean(self):
    #     print('////////////////', self.type_question)
    #     if self.type_question == 0:
    #         raise ValidationError("Не соответствие типа вопроса и кол-ва ответов ===========")

    # def save_related(self, request, form, formsets, change):
    #     # invoice = form.instance
    #     # invoice.total = 0
    #     # for inlines in formsets:
    #     #     for inline_form in inlines:
    #     #         invoice.total = invoice.total + inline_form.cleaned_data.get('price') * inline_form.cleaned_data.get('quantity')
    #     # invoice.save()
    #     # super(InvoiceAdmin, self).save_related(request, form, formsets, change)
    #
    #     question = form.instance
    #     print('----------1---------- ', question)
    #     question = form.fields
    #     print('----------2---------- ', question)
    #     req = dict(request.POST)
    #     type_question = int(req['type_question'][0])
    #     answers = req['answers']
    #     print('>>>>====>>>>>>>>>>.. ', req)
    #     print('<<<<<<<<<<< ', form.instance.__dict__)
    #     print('>>>>>>>>>>>>>>..', answers, '-L=--', len(answers))
    #     # ans = ans.get('answers')
    #     print('<<<<<<<<<<< ', form.instance.answers)
    #     print('<<<<<<<<<<< ', type_question, '==', type(type_question))
    #
    #     if type_question == 0 and len(answers) > 0:
    #         raise Exception('Не соответствие типа вопроса и кол-ва ответов')
    #     # if type_question == 1 and len(answers) != 1:
    #     #     raise Exception('Не соответствие типа вопроса и кол-ва ответов')
    #     #     # return  # Yoko shall never have her own blog!
    #     else:
    #         form.save(commit=False)
    #         form.save_m2m()
    #         question.save()
    #         # super().save(*args, **kwargs)  # Call the "real" save() method.
    #         # super().save_related(self, request, form, formsets)  # Call the "real" save() method.
    #     #     super(QuestionAdmin, self).save_model(self, request, form, change)




    # # def save(self, *args, **kwargs):
    # def save_related(self, request, form, formsets, change):
    #
    #     sp = super().save(*args, **kwargs)
    #     self.answers.update()
    #     print('++++++ SAVE----- ', sp, self.type_question, self.answers, self.get_answers())
    #     if self.type_question == 0 and len(self.answers) > 0:
    #         raise Exception('Не соответствие типа вопроса и кол-ва ответов')
    #     if self.type_question == 1 and len(self.answers) != 1:
    #         raise Exception('Не соответствие типа вопроса и кол-ва ответов')
    #         # return  # Yoko shall never have her own blog!
    #     else:
    #         super().save(*args, **kwargs)  # Call the "real" save() method.



    # def clean(self):
    #     """Make sure all managers are also members."""
    #     for manager in self.cleaned_data['answers']:
    #         print('0000000000000 ', manager)
    #         if manager not in self.cleaned_data['answers']:
    #             self.cleaned_data['answers'].append(manager)
    #     return self.cleaned_data

