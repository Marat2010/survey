# import json

from django.shortcuts import render
from rest_framework import generics
from django.http import HttpResponse
from rest_framework.response import Response
from rest_framework.permissions import IsAuthenticated
from rest_framework.authentication import TokenAuthentication, BasicAuthentication, SessionAuthentication
from rest_framework.utils import json

from .models import Survey, Question, Answer, User, UserAnswer
from django.utils import timezone
# from datetime import datetime
from django.shortcuts import get_object_or_404
from django.db.models import Q
from rest_framework.exceptions import APIException, ParseError, NotFound
from rest_framework.decorators import action
from rest_framework.viewsets import ModelViewSet
from .serializers import AnswerSerializer, QuestionSerializer,\
    SurveySerializer, SurveyRetrieveSerializer, SurveyListSerializer, UserAnswerSerializer,\
    SurveyDetailSerializer, SurveyQuestionsSerializer, \
    AnswerListSerializer
from .utils import check_user_session, check_answers
MY_HOST = "http://localhost:8000"  # for index and doc_api in docker


# ------------- Section Start page and documentation -----------------

def index(request):
    check_user_session(request)
    return render(request, 'api/index.html', {"host": MY_HOST})


def doc_api(request):
    return render(request, 'api/doc_api.html', {"host": MY_HOST})


# -------- ADMIN: Добавление и редактирование ответов, вопросов, опросов --------
class AnswerViewSet(ModelViewSet):
    """ For the administrator - viewing, adding and editing answers. """
    queryset = Answer.objects.all()
    serializer_class = AnswerSerializer
#     authentication_classes = [SessionAuthentication, BasicAuthentication]
#     permission_classes = (IsAuthenticated,)


class QuestionViewSet(ModelViewSet):
    """ For the administrator - viewing, adding and editing questions."""
    queryset = Question.objects.all()
    serializer_class = QuestionSerializer
#     authentication_classes = [SessionAuthentication, BasicAuthentication]
#     permission_classes = (IsAuthenticated,)


class SurveyViewSet(ModelViewSet):
    """ For the administrator - viewing, adding and editing surveys."""
    queryset = Survey.objects.all()
    serializer_class = SurveySerializer

    def get_serializer_class(self):
        if self.request.method == 'GET':
            if self.action == 'list':
                return SurveySerializer  # Сериализатор для списков
            return SurveyRetrieveSerializer  # Сериализатор для отдельной записи
            # return SurveySerializer  # Сериализатор для отдельной записи
        return SurveySerializer  # Сериализатор обновления/создания записей

# ------------------------------------------------
#     def retrieve(self, request, *args, **kwargs):
#         # do your customization here
#         instance = self.get_object()
#         serializer = self.get_serializer(instance)
#         # data = serializer.data['questions']
#         # print(f"+++++++ RETRIVE +++ {data}")
#         questions = instance.questions.all()
#         print(f"=== questions === {questions}")
#         data = []
#         for i in questions:
#             print(f"------ i: {i.pk}: {i.question_text}")
#             data.append({"id": i.pk, "question_text": i.question_text})
#         print(f"=== data === {data}")
#         # ret['WeatherForecastLongTermTimePeriods'] = json.loads(ret['WeatherForecastLongTermTimePeriods'])
#         data_json = json.loads(data)
#
#         data_json = json.loads(questions)
#
#         serializer.data['questions'] = data_json
#         print(f"=== serializer.data === {serializer.data}")
#         # print(f"=== serializer.fields === {serializer.fields.fields['questions']}")
#
#         return Response(serializer.data)
# ----------------------------------------------------
    # json_obj = json.loads(model.json_text)
    # data = serializer.data
    # data["field"] = json_obj
    # return Response(data)
# -------------------------------------------------------
    # def list(self, request, *args, **kwargs):
    #     print(f"==========LIST: {kwargs}")
    #     serializer = self.serializer_class
    #     result_set = serializer.data
    #     return Response(result_set)
# ------ END (ADMIN: Добавление и редактирование ответов, вопросов, опросов) -------


# -------------  ADMIN: SECTION FOR SURVEY  -----------------
class SurveyListView(generics.ListAPIView):
    serializer_class = SurveyListSerializer
    queryset = Survey.objects.filter(date_end__gte=timezone.now())


class SurveyDetailView(generics.RetrieveUpdateAPIView):
    serializer_class = SurveyDetailSerializer
    queryset = Survey.objects.filter(date_end__gte=timezone.now())
# -------------  END (ADMIN: SECTION FOR SURVEY)  -----------------


class SurveyQuestionsView(generics.RetrieveUpdateAPIView):
    serializer_class = SurveyQuestionsSerializer
    queryset = Survey.objects.filter(date_end__gte=timezone.now())

    # def update(self, request, *args, **kwargs):
    #     pass

    def perform_update(self, serializer):
        user = self.request.user
        print(f'========USER: {user}')
        # serializer.save(user=self.request.user)



# --------------------------------------------------------------------
# class SurveyQuestionsListView(generics.ListAPIView):
#     serializer_class = SurveyQuestionsSerializer
#     queryset = Survey.objects.filter(date_end__gte=timezone.now())


# ---------------------------------------------------------------------
# ---------------------------------------------------------------------
# ---------------------------------------------------------------------
# ---------------------------------------------------------------------
# ---------------------------------------------------------------------
# class QuestionToListAnswerView(generics.ListCreateAPIView):
# class QuestionToListAnswerViewSet(ModelViewSet):
#     """ For the administrator - viewing, adding and editing questions."""
#     queryset = Question.objects.all()
#     serializer_class = QuestionToListAnswerSerializer
#
#     # def get_serializer_context(self):
#     #     # if self.request.user.is_staff:
#     #     #     return QuestionSerializer
#     #     print(f"====1===:  {self.request.__dict__}")
#     #     return QuestionToListAnswerSerializer
#
#     # def perform_update(self, serializer):
#     # def perform_create(self, serializer):
#     #     print(f"====1===:  {self.request.__dict__}")
#     #     print(f"====2===:  {serializer.__dict__}")

# # ------- Добавление и редактирование ответов и вопросов (Без ViewSet) -----------
# # class AnswerListView(generics.ListAPIView):
# class AnswerListView(generics.ListCreateAPIView):
#     serializer_class = AnswerSerializer
#     queryset = Answer.objects.all()
#
#
# # class AnswerDetailView(generics.RetrieveUpdateAPIView):
# class AnswerDetailView(generics.RetrieveUpdateDestroyAPIView):
#     serializer_class = AnswerSerializer
#     queryset = Answer.objects.all()
# # ----- END (Добавление и редактирование ответов и вопросов (Без ViewSet)) --------


# ---------------------------------------------------------
    # def list(self, request, *args, **kwargs):
    #     serializer = SurveyListSerializer(self.queryset, many=True)
    #     return Response(serializer.data)
# class SurveyDetailView(generics.ListCreateAPIView):
    # serializer_class = SurveyDetailSerializer
    # queryset = Survey.objects.get(pk=1)
    # serializer_class = UserAnswerSerializer

# ---------------------------------------------------------
# ---------------------------------------------------------
    # def get_queryset(self):
    #     questions = get_object_or_404(Survey, pk=self.kwargs['pk'])
    #     print(f'====1===: {self.queryset}')
    #     print(f'====2===: {questions}')
    #     print(f'====3===: {questions.__dict__}')
    #     questions = Survey.objects.questions
    #     return questions


# # class SurvDetailView(generics.RetrieveUpdateAPIView):
# class SurvDetailView(generics.ListCreateAPIView):
#     serializer_class = SurvSerializer
#     # queryset = Survey.objects.filter(date_end__gte=timezone.now())
#     queryset = Survey.objects.get(pk=2).questions.all()

    # def create(self, request, *args, **kwargs):
    #     print(f"==V=1: {self.__dir__()}")
    #     print(f"==V=1.2: {self.get_serializer_context()}")
    #     print(f"==V=1.3: {self.request.POST.__dir__()}")
    #     for i in self.get_queryset():
    #         print(f"----Q---: {i.answers.all()}")
    #
    #     print(f"==V=2: {self.request.query_params}")
    #     print(f"==V=3: {request.data}")
    #     for q in request.data:
    #         print(f"-------: {q['question_text']}")
    #         print(f"-------: {q['answers']}")
    #         print(f"-------: {q['answers']}")
    #     return self

    # def perform_create(self, serializer):
    #     print(f"++++: {serializer.__dict__}")
    #     # serializer.save(ip=get_client_ip(self.request))


# ------------- END SECTION FOR SURVEY -----------------



# # -------------- Admin section --------------------------------------
#
# class AnswerViewSet(ModelViewSet):
#     """ Displaying a list of all answer for admin"""
#     queryset = Answer.objects.all()
#     serializer_class = AnswerSerializer
#     authentication_classes = [SessionAuthentication, BasicAuthentication]
#     permission_classes = (IsAuthenticated,)
#
#
# class QuestionViewSet(ModelViewSet):
#     """ Displaying a list of all question for admin"""
#     queryset = Question.objects.all()
#     serializer_class = QuestionSerializer
#     authentication_classes = [SessionAuthentication, BasicAuthentication]
#     permission_classes = (IsAuthenticated,)
#
#
# class SurveyViewSet(ModelViewSet):
#     """ Displaying a list of all surveys for admin"""
#     queryset = Survey.objects.all()
#     serializer_class = SurveySerializer
#     authentication_classes = [SessionAuthentication, BasicAuthentication]
#     permission_classes = (IsAuthenticated,)
#
#
# class UserAnswerViewSet(ModelViewSet):
#     """ Displaying a list User answers for admin"""
#     queryset = UserAnswer.objects.all()
#     serializer_class = UserAnswerSerializer
#     authentication_classes = [SessionAuthentication, BasicAuthentication]
#     permission_classes = (IsAuthenticated,)
#
# # -------------- Admin section --------------------------------------


# -------------- User section --------------------------------------
# # -------------- User section --------------------------------------
# class SurveyListView(generics.ListAPIView):
#     """ Displaying a list of active surveys"""
#     serializer_class = SurveyListSerializer
#     # queryset = Survey.objects.filter(date_end__gte=timezone.now())
#
#     def get_queryset(self):  # Фильтрация в адр.строке (?name=...&date_end=...)
#         # queryset = Survey.objects.all()
#         queryset = Survey.objects.filter(date_end__gte=timezone.now())
#
#         params = self.request.query_params
#         # print(f"====get params: {params}")
#         name = params.get('name', None)
#         date_start = params.get('date_start', None)
#         date_end = params.get('date_end', None)
#
#         if name:
#             queryset = queryset.filter(name__contains=name)
#         if date_start:
#             queryset = queryset.filter(date_start__gte=date_end)
#         if date_end:
#             queryset = queryset.filter(date_end__gte=date_end)
#
#         return queryset
#
#
# class SurveyDetailView(generics.RetrieveUpdateAPIView):
#     """ Displaying detail of survey"""
#     serializer_class = QuestionsListSerializer
#     queryset = Survey.objects.filter(date_end__gte=timezone.now())
#
#     def get(self, request, *args, **kwargs):
#         queryset = Survey.objects.get(pk=kwargs['pk']).questions.all()
#         print(f"++++ {queryset} ++++ {check_user_session(request)} +++ {request.user}")
#         serializer = QuestionsListSerializer(queryset, many=True)
#         print(f"===serialiser data ==== {serializer.data}")
#         return Response(serializer.data)
#
#     def put(self, request, *args, **kwargs):
#         data = request.data
#         print(f"===--data--------1: {data}")
#         user_answers_pk = []
#         for q_a in data:
#             user = User.objects.get(pk=check_user_session(request))
#             survey = Survey.objects.get(pk=kwargs['pk'])
#             question = Question.objects.get(pk=q_a['id'])
#             answers = q_a['answers']
#             type_answer = q_a['type_answer']
#             answer_obj = check_answers(answers, type_answer)
#
#             # user_answer = UserAnswer.objects.get(user=user, survey=survey, question=question)
#             user_answer, _ = UserAnswer.objects.get_or_create(user=user, survey=survey, question=question)
#             # user_answer, _ = UserAnswer.objects.create(user=user, survey=survey, question=question)
#             # user_answer, _ = UserAnswer.objects.update_or_create(user=user, survey=survey, question=question)
#                                                                  # defaults={'question': question})
#             print(f"==== user_answer ===: {user_answer}")
#             user_answers_pk.append(user_answer.pk)
#             for obj in answer_obj:
#                 print(f"==== obj====: {obj}")
#                 # user_answer.answer.add(obj)
#             user_answer.answer.set(answer_obj)
#
#         print(f"----user_answers_pk---{user_answers_pk}")
#         queryset_answers = UserAnswer.objects.filter(pk__in=user_answers_pk)
#         print(f"----queryset_answers---{queryset_answers}")
#
#         # serializer = QuestionsListSerializer(data)
#         serializer = UserAnswerDetailSerializer(queryset_answers, many=True)
#
#         print(f"___data__:{data}")
#         # print(f"___ser data__:{serializer.data}")
#         return Response(serializer.data)
#
# # -------------- User section END-----------------------------------
# # -------------- User section END-----------------------------------


# ----------------------------------------------------------
# ----------------------------------------------------------
# ----------------------------------------------------------
# ----------------------------------------------------------
        # queryset = self.get_queryset()
        # print(f"===Get queryset: {queryset}")
        # queryset = Survey.objects.get(pk=kwargs['pk']).questions.all().select_related()
        # queryset = Survey.objects.get(pk=kwargs['pk']).questions.all().prefetch_related()
# ----------------------------------------------------------
            # user_answer.answer.set(answer)
            # print(f"====-----5: {user_answer.question} ==Answer=== {user_answer.answer}")
        # serializer = QuestionsListSerializer(data=data, context={"request": request}, many=True)
        # serializer = QuestionsListSerializer(data, many=True)
        # serializer.is_valid()
# ----------------------------------------------------------
        # print(f"===----------3: {check_user_session(request)}")
        # print(f"===----------2: {kwargs}")
        # user_answer = {}
        # user_answers_data = self.get_queryset()
        # print(f"===----------3.5 queryset: {user_answers_data}")
        # queryset = Survey.objects.get(pk=kwargs['pk']).questions.all()
        # ques1 = get_object_or_404(queryset)
        # print(f"===ques1: {ques1}")
# ----------------------------------------------------------
        # user_answers_data.append(user_answer)
        # print(f"====-----6 Answers_data: {user_answers_data}")
        # serializer = UserAnswerDetailSerializer(user_answers_data)
        # serializer.is_valid()
        # print(f"=== -------- Serialz valid ==== {serializer.is_valid}")
        # print(f"=== -------- Serialz data ==== {serializer.validated_data}")
# ----------------------------------------------------------
# if len(answer_id) != 0:
#     # answer_id = answer_id.pop()
#     answer_id = answer_id[0]
#     print(f"===----------4: {answer_id} === {type(answer_id)}")
#     answer = Answer.objects.get(pk=answer_id['id'])
# else:
#     answer = Answer.objects.get(pk=2)
# ----------------------------------------------------------
    # car_object.car_brand = data["car_brand"]
    # car_object.car_model = data["car_model"]
    # car_object.production_year = data["production_year"]
    # car_object.car_body = data["car_body"]
    # car_object.engine_type = data["engine_type"]
    #
    # car_object.save()

    # def get_queryset(self):
    #     pass

    # def get(self, request, *args, **kwargs):
    #     print(f"<<<<<<<<:: {request.__dir__()}")
    #     print(f"<<<<<<<<:: {request.user}")
    #     print(f"<<<<<<<<:: {self.queryset.values()}")
    #     instance = self.get_object()
    #     print(f"``````````: {instance.id}")
    #     # self.queryset = request.data['questions']

    # def put(self, request, *args, **kwargs):
    #     # ret = super().put(self, request, *args, **kwargs)
    #     print(f">>>>>>: {self.queryset.values()}\n >>>>>>> {request.data} >>>>> {args} >>>>>>{kwargs}")
    #     print(f">>>>>>: {check_user_session(request)}")
    #     print(f">>>>>>: {request.data['questions']}")
    #
    #     partial = kwargs.pop('partial', False)
    #     instance = self.get_object()
    #     serializer = self.get_serializer(instance, data=request.data, partial=partial)
    #     serializer.is_valid(raise_exception=True)
    #     self.perform_update(serializer)
    #
    #     if getattr(instance, '_prefetched_objects_cache', None):
    #         # If 'prefetch_related' has been applied to a queryset, we need to
    #         # forcibly invalidate the prefetch cache on the instance.
    #         instance._prefetched_objects_cache = {}
    #
    #     return Response(serializer.data)

        # return ret

    # def retrieve(self, request, *args, **kwargs):
    #     instance = self.get_object()
    #     serializer = self.get_serializer(instance)
    #     return Response(serializer.data)

# def update(self, request, *args, **kwargs):
    #     pass

    # def retrieve(self, request, *args, **kwargs):
    #     print(f'======RETTRIVE 1=== {self.queryset} == {request.session.get("user_session")}')
    #     print(f'======RETTRIVE 2=== {args} == {kwargs}')
    #
    # # def retrieve(self, request, *args, **kwargs):
    #     instance = self.get_object()
    #     # instance = self.queryset()
    #     for i in instance:
    #         print(i)
    #     print(f'======RETTRIVE 3=== {instance}')
    #     serializer = self.get_serializer(instance)
    #     print(f'======RETTRIVE 4=== {instance} == {serializer.data}')
    #
    #     return Response(serializer.data)



# # class QuestionsListView(generics.ListAPIView):
# class QuestionsListView(generics.ListCreateAPIView):
#     serializer_class = QuestionsListSerializer
#     queryset = Question.objects.all()
#
#     def get_queryset(self, *args, **kwargs):
#         queryset_list = Question.objects.all()
#         query = self.kwargs['pk']
#         queryset_list = queryset_list.filter(surveys=query)
#         return queryset_list






# class UserAnswerView(generics.CreateAPIView):
#     serializer_class = UserAnswerSerializer
#     queryset = UserAnswer.objects.all()
#

# def get(self, request, format=None):
    #     content = {
    #         'user': unicode(request.user),  # `django.contrib.auth.User` instance.
    #         'auth': unicode(request.auth),  # None
    #     }
    #     print('---------- ', content)
    #     return Response(content)

    # def get(self):
    #     print('=========== ', self)
    #     return self

# ----------------------------------------------------------
    # def get_queryset(self):
    #     queryset = Survey.objects.filter(date_end__gte=timezone.now())
    #     user_session = self.request.session.get('user_session')
    #     if not user_session:
    #         self.request.session['user_session'] = '333'
    #     print('====2====== ', self.request.session['user_session'])
    #     print('=====2.1===== ', self.request.query_params)
    #     return queryset

# ----------------------------------------------------------
# ----------------------------------------------------------
    # user_session = request.session.get('user_session')
    # if not user_session:
    #     # user = User.objects.create(name='User Session')
    #     user_session = User.objects.create().pk
    #     # user_session = user.pk
    #     User.objects.update_or_create(pk=user_session, defaults={'name': f'User Session {user_session}'})
    #     # User.objects.update_or_create(pk=user.pk, defaults={'name': f'User Session {user_session}'})
    #
    #     request.session['user_session'] = user_session
    #     print('=====1.5 ==New=== ', user_session)
    #
    # print('=====1===== ', request.session['user_session'])
    # print('=====1.2===== ', request.session.values())
    # print('=====1.3===== ', request.session.keys())
    # print('=====1.4===== ', user_session)
# ----------------------------------------------------------
# =====1.2=====  dict_values(['3', 'django.contrib.auth.backends.ModelBackend', 'f60c9b27ca16e3d4de333f3608b94c6b26a5c10873fcdb2af1cd1f47382cc024', '212'])
# =====1.3=====  dict_keys(['_auth_user_id', '_auth_user_backend', '_auth_user_hash', 'user_session'])
# ----------------------------------------------------------
# class SurveysListView(generics.ListAPIView):
#     serializer_class = SurveySerializer
#     queryset = Survey.objects.filter(date_end__gt=timezone.now())
#
#
# # class SurveyDetailView(generics.RetrieveUpdateDestroyAPIView):
# #  Детальная инофрмация обопроснике
# class SurveyDetailView(generics.RetrieveAPIView):
#     serializer_class = SurveyDetailSerializer
#     queryset = Survey.objects.filter(date_end__gt=timezone.now())
#
#
# class QuestionsListView(generics.ListAPIView):
#     serializer_class = QuestionSerializer
#     queryset = Question.objects.all()
#     # permission_classes = (IsAuthenticated,)
#
#
# class QuestionDetailView(generics.RetrieveAPIView):
#     serializer_class = QuestionDetailSerializer
#     queryset = Question.objects.all()
#
#
# class AnswersListView(generics.ListAPIView):
#     serializer_class = AnswerSerializer
#     queryset = Answer.objects.all()
#     # permission_classes = (IsAuthenticated,)
#
#
# # Список вопросов в опроснике
# # class SurveyQuestionView(generics.RetrieveAPIView):
# # class SurveyQuestionView(generics.RetrieveUpdateAPIView):
# class SurveyQuestionView(generics.ListAPIView):
#     # serializer_class = SurveyDetailSerializer
#     # queryset = Question.objects.all()
#     serializer_class = QuestionSerializer
#     # fields = ['question_text', 'answers']
#
#     def get_queryset(self, *args, **kwargs):
#         print('>>11>>>>>>>>>>> ', self.kwargs['pk'])
#         queryset_list = Question.objects.all()
#         print('>>>>>>>.. 222 >>>>>', self.queryset, queryset_list)
#
#         query = self.kwargs['pk']
#         queryset_list = queryset_list.filter(surveys=query)
#
#
#         print('>>>>>>>.. 333 >>>>>', queryset_list)
#
#         return queryset_list
#
#
# # class UserAnswersView(generics.ListCreateAPIView):
# # class UserAnswersView(generics.RetrieveUpdateAPIView):
# # class UserAnswersView(ModelViewSet):
# class UserAnswersViewSet(ModelViewSet):
#     # queryset = UserAnswer.objects.all()
#     # queryset = Question.objects.all()
#     queryset = Survey.objects.all()
#     # serializer_class = UserAnswersSerializer
#     serializer_class = SurveySerializer
#
#     # def get_queryset(self, *args, **kwargs):
#     #     # queryset_list = Survey.objects.all()
#     #     # print('>>>>>>>.. 222 >>>>>', self.queryset, queryset_list)
#     #
#     #     query = self.kwargs['pk']
#     #     # queryset_list = queryset_list.filter(surveys=query)
#     #
#     #     queryset_list = super(UserAnswersViewSet, self).get_queryset(*args, **kwargs)
#     #     # queryset_list = super(UserAnswersViewSet, self).get_queryset(surveys=query)
#     #     print('>>>>>>>.. 333 >>>>>', queryset_list)
#     #     for q in queryset_list:
#     #         print('----- ', q.questions.all())
#     #         for i in q.questions.all():
#     #             print(i.question_text)
#     #             # i.self.pk = i.question_text
#     #         # print(q.questions.question_text)
#     #
#     #     return queryset_list
# ------------------------------------------------------------------------------

# ---------------------
    # def get_object(self):
    #     return object



# -------------------------------------------------------
# -------------------------------------------------------
# -------------------------------------------------------
# # query = self.request.GET.get("q")
# if query:
#     queryset_list = queryset_list.filter(Q(surveys=query))
# -------------------------------------------------------
        # queryset = self.get_queryset().surveys.filter(self.kwargs['pk'])
        # queryset = super(SurveyQuestionView, self).get_queryset(*args, **kwargs)
# -------------------------------------------------------
    # print('``````=== ', serializer_class.data)
    # serializer_class = QuestionSerializer
    # queryset = Question.survey_objects.all()
    # queryset = Survey.objects.filter(date_end__gt=timezone.now())
    # dd = serializer_class.get_fields()

    # @staticmethod
    # def get_question(self):
    #     queryset = Question.objects.filter(surveys=self.kwargs['pk'])
    #     return queryset
# -------------------------------------------------------
        # assert self.queryset is not None, (
        #     "'%s' should either include a `queryset` attribute, "
        #     "or override the `get_queryset()` method."
        #     % self.__class__.__name__
        # )

        # queryset = self.queryset
        # if isinstance(queryset, QuerySet):
        #     # Ensure queryset is re-evaluated on each request.
        #     queryset = queryset.all()

    # get_serializer(instance)
    # print('++++++++', serializer_class.__dir__(object))

    # def get_object(self):
    #     queryset = self.get_queryset()
    # #     filter = {}
    # #     # for field in self.multiple_lookup_fields:
    # #     #     filter[field] = self.kwargs[field]
    # #     # alook = self.__dir__()
    # #     alook = self.get_view_name()
    # #     print('````````````',  self.request.__dict__, '\n======-----', type(self.request.__dict__))
    # #     print('>>>>>>>>>>>>> ', self.__getattribute__('kwargs'))
    # #     print('>>>>>>>>>>>>> ', self.__getattribute__('kwargs')['pk'])
    # #     print('>>11>>>>>>>>>>> ', self.kwargs['pk'])
    #     print('>>>333>>>>>>>>>> ', queryset)
    # #     obj = get_object_or_404(queryset, **filter)
    #     obj = queryset
    # #     self.check_object_permissions(self.request, obj)
    #     return obj
# -------------
    # def filter_queryset(self, queryset):
    #     filter_backends = [CategoryFilter]
    #
    #     if 'geo_route' in self.request.query_params:
    #         filter_backends = [GeoRouteFilter, CategoryFilter]
    #     elif 'geo_point' in self.request.query_params:
    #         filter_backends = [GeoPointFilter, CategoryFilter]
    #
    #     for backend in list(filter_backends):
    #         queryset = backend().filter_queryset(self.request, queryset, view=self)
    #
    #     return queryset



# -----------------------------------------------------------------------
# ----------------------------------------------------------
# ----------------------------------------------------------
# ----------------------------------------------------------
    # queryset = Survey.objects.all()
    # queryset = Survey.objects.filter(pk=5)
    # queryset = Survey.objects.filter(pk=serializer_class.validated_data)
# ----------------------------------------------------------
    # queryset = Question.objects.filter(date_end__gt=timezone.now())
# -----------------------------------------------------------
    # def __init__(self, *args, **kwargs):
    #     super(SurveysListView, self).__init__(*args, **kwargs)
    #     print(self.queryset)  # request.session)
    #     print(self.get_serializer())  # request.session)
    #     print('==========', self.get_object.__dir__())  # request.session)
        # print(self.serializer_class.data.__dir__()) # request.session)
    #     self.fields['answer'].label = self.instance.question  # change required label ... and answers
    #     self.fields['answer'].queryset = Test.objects.get(question=self.instance.question).answers.all()
    #     self.fields['answer'].empty_label = None
# -----------------------------------------------------------
    # queryset = Survey.objects.all()
    # print('tmz==========', timezone.now())
    # print('tmz_localize==========', timezone.get_current_timezone().localize(datetime.now()))
# --------------------------
# queryset = Survey.objects.filter(date_end__lt=datetime.now())
# -------------------------------
# timezone.get_current_timezone().localize(datetime.now())
# datetime.datetime(2021, 3, 5, 3, 5, 53, 898093, tzinfo=<DstTzInfo 'Europe/Moscow' MSK+3:00:00 STD>)
    # return render(request, 'HTML/index.html')


