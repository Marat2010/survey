API системы опросов пользователей (Docker)
-------------------------------------------
1. Распаковать архив и перейти в папку.
2. Запустить контейнеры одним из способов:

    - При первом запуске (или при изменениях):

    $ docker-compose up --build

    - Запуск контейнеров:

    $ docker-compose up

    - С указанием запускаемого файла:

    $ docker-compose -f ./docker-compose.yml up

    - В фоне:

    $ docker-compose up -d

3. После запуска контейнеров, перейти по http://localhost:8000/,
где будет документация по API.

-------------------------------------------
### Доп. информация 


Доступ по `"localhost"` или `"127.0.0.1"`, порт `"8000"`.

Первая станица тех.задание, документация по API и вход в API.

API:  http://localhost:8000/api/v1/surveys/

API-Admin: http://localhost:8000/api/v1/api-admin/

Login API-Admin: http://localhost:8000/api/v1/api-auth/login/

Админ Django: http://localhost:8000/admin/

Swagger, Redoc: http://localhost:8000/swagger/ , http://localhost:8000/redoc/

Доступ к Adminer БД порт `"9000"`: http://localhost:9000/

-------------------------------------------
#### Остановка контейнеров:

$ docker-compose down

Удаляет контейнеры, сеть, но оставляет тома.
Для полной очистки можно их удалить:

$ docker volume ls

$ docker volume rm <VOLUME_NAME>

-------------------------------------------
***Папки "nginx" и "postgres" для создания соотв. контейнеров.*** 

***Папка "survey" - само приложение.***

-------------------------------------------
Доступ к БД из локалки:  192.168.0.244:5432

Для просмотра адреса:

$ docker network ls

$ docker network inspect <NETWORK_ID>

-------------------------------------------
