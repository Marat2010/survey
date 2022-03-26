from datetime import time

from django.utils.datetime_safe import datetime

from api.models import UserAnswer
from datetime import datetime
# import os, sys
# from survey.settings import BASE_DIR
# from django.conf import settings
#
# settings.configure()
# os.environ.setdefault("DJANGO_SETTINGS_MODULE", "survey.settings")
#
# sys.path.append(BASE_DIR)

# export DJANGO_SETTINGS_MODULE="myproject.settings"
""" теперь можно импортировать модели и пр. """

# from cpanel.models import MyModel
#
# all = MyModel.objects.all()
#
# print(all)


def te1():
    time0 = datetime.now()
    # ua = UserAnswer.objects.all()
    ua = UserAnswer.objects.prefetch_related().all()
    print('-----')
    # if __name__ == '__main__':
    for s in ua:
        print(s.user.name)
        print(s.user.id)

    print('Vremya: ', datetime.now() - time0)





