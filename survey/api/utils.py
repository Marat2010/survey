from .models import User, Question, Answer, UserAnswer
from django.shortcuts import get_object_or_404
from rest_framework.exceptions import APIException, ParseError, NotFound
from django.core.exceptions import FieldError  # Http404


def check_user_session(request) -> int:
    """ Проверка нового пользователя, добавление в таблицу """
    user_session = request.session.get('user_session')
    # print(f"_________user: {request.user.username}_____ {request.user.pk}")
    if not user_session:
        user = User.objects.create(name=request.user.__str__())
        user_session = user.pk
        request.session['user_session'] = user_session
    elif request.user != 'AnonymousUser':
        User.objects.update_or_create(pk=user_session,
                                      defaults={'name': request.user.__str__()})
    return user_session


def check_answers(answers, type_answer):
    print(f"===----------4: {answers} === {type(answers)}")
    if isinstance(answers, str) and type_answer == "Свой ответ":
        answer_obj, _ = Answer.objects.get_or_create(answer=answers)
        answer_obj = (answer_obj,)
    elif len(answers) == 1 and \
            (type_answer == "Выбор одного ответа" or type_answer == "Выбор нескольких ответов"):
        answers = answers[0]
        answer_obj = Answer.objects.get(pk=answers['id'])
        answer_obj = (answer_obj,)
    elif len(answers) > 1 and type_answer == "Выбор нескольких ответов":
        answer_obj = ()
        for item in answers:
            item_obj = Answer.objects.get(pk=item['id'])
            answer_obj += (item_obj,)
    else:
        raise NotFound("!!!Не соответсвтие типа ответа и самого ответа(ответов)!!!")
    return answer_obj


# -------------------------------------------------
# user = User.objects.create(name=request.user.username)
# user = User.objects.create(name=request.user.__str__())
# or request.user != 'AnonymousUser'
# user, _ = User.objects.update_or_create(pk=user.pk,
#                                         defaults={'name': request.user.__str__})
#                               # defaults={'name': f'User Session {user_session}'})
# answer_obj.append(item_obj)

# -----------------------------------------------------------
    # print('-------begin --------', user_session)
    # print(f'===USER==={user_session}, тип: {type(user_session)}')
    #     print('=====1.5 ==New=== ', user_session)
    #
    # print('=====1===== ', request.session['user_session'])
    # print('=====1.2===== ', request.session.values())
    # print('=====1.3===== ', request.session.keys())
    # print('=====1.4===== ', user_session)
    #
    # # return
# -----------------------------------------------------
# raise Exception('!!!Не соответсвтие ответа и типа ответа!!!')
# raise FieldError('Не соответс')
# answer_obj = None
# answer_obj = get_object_or_404()
# answer_obj = (answer_obj,)

# -----------------------------------------------------------------
# user = User.objects.create(name='User Session')
# user_session = user.pk
# User.objects.update_or_create(pk=user.pk, defaults={'name': f'User Session {user_session}'})

# -----------------------------------------------------------------
# -----------------------------------------------------------------
# -----------------------------------------------------------------
# -----------------------------------------------------------------
# -----------------------------------------------------------------