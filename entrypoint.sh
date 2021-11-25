#!/bin/sh

python manage.py migrate --no-input
python manage.py collectstatic --no-input

gunicorn survey.wsgi:application --bind 0.0.0.0:8000


#---------------------------------------------------------
# Запустить после старта для создания админ пользователя:
# docker container exec -it survey_web_1 ./manage.py createsuperuser
# Сделали перенос и востановление из бэкапа, запускать не надо!!!
# Убрал временно, в postgres/Dockfile закоментировал строку:
# ADD ./backup/DB.sql /docker-entrypoint-initdb.d
# После как база будет нормальной раскоментировать.
#---------------------------------------------------------


