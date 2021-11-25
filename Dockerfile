FROM python:3.8-slim

RUN pip install --upgrade pip

COPY ./requirements.txt .
RUN pip install -r requirements.txt

COPY ./survey /app

WORKDIR /app

## set environment variables
# Python не будет пытаться создавать файлы .pyc
ENV PYTHONDONTWRITEBYTECODE 1
# видеть выходные данные своего приложения и не буферизируется
ENV PYTHONUNBUFFERED 1

COPY ./entrypoint.sh /
ENTRYPOINT ["sh", "/entrypoint.sh"]

