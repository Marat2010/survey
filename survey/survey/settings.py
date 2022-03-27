"""
Django settings for survey project.

Generated by 'django-admin startproject' using Django 2.2.10.

For more information on this file, see
https://docs.djangoproject.com/en/2.2/topics/settings/

For the full list of settings and their values, see
https://docs.djangoproject.com/en/2.2/ref/settings/
"""

import os
# import drf_yasg

# Build paths inside the project like this: os.path.join(BASE_DIR, ...)
BASE_DIR = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))


# Quick-start development settings - unsuitable for production
# See https://docs.djangoproject.com/en/2.2/howto/deployment/checklist/

# SECURITY WARNING: keep the secret key used in production secret!
# SECRET_KEY = 'xx....xx'
SECRET_KEY = os.getenv('SECRET_KEY')

# SECURITY WARNING: don't run with debug turned on in production!
# DEBUG = True
DEBUG = os.getenv('DEBUG')

ALLOWED_HOSTS = ['*']

# Application definition


INSTALLED_APPS = [
    'django.contrib.admin',
    # 'related_admin',
    'django.contrib.auth',
    'django.contrib.contenttypes',
    'django.contrib.sessions',
    'django.contrib.messages',
    'django.contrib.staticfiles',
    'rest_framework',
    'api.apps.ApiConfig',
    # 'my_test.apps.MyTestConfig',  # for my test
    'debug_toolbar',
    'drf_yasg2',
    'rest_framework_swagger',
    'corsheaders',
    'djoser'
]
MIDDLEWARE = [
    'django.middleware.security.SecurityMiddleware',
    'whitenoise.middleware.WhiteNoiseMiddleware',
    'django.contrib.sessions.middleware.SessionMiddleware',
    'corsheaders.middleware.CorsMiddleware',
    'django.middleware.common.CommonMiddleware',
    'django.middleware.csrf.CsrfViewMiddleware',
    'django.contrib.auth.middleware.AuthenticationMiddleware',
    'django.contrib.messages.middleware.MessageMiddleware',
    'django.middleware.clickjacking.XFrameOptionsMiddleware',
    'debug_toolbar.middleware.DebugToolbarMiddleware',
]

ROOT_URLCONF = 'survey.urls'

TEMPLATES = [
    {
        'BACKEND': 'django.template.backends.django.DjangoTemplates',
        'DIRS': [],
        'APP_DIRS': True,
        'OPTIONS': {
            'context_processors': [
                'django.template.context_processors.debug',
                'django.template.context_processors.request',
                'django.contrib.auth.context_processors.auth',
                'django.contrib.messages.context_processors.messages',
            ],
        },
    },
]

WSGI_APPLICATION = 'survey.wsgi.application'

# Database
# https://docs.djangoproject.com/en/2.2/ref/settings/#databases

DATABASES = {
    "default": {
        "ENGINE": os.environ.get("SQL_ENGINE_SURVEY", "django.db.backends.sqlite3"),
        "NAME": os.environ.get("SQL_DATABASE_SURVEY", os.path.join(BASE_DIR, "db.sqlite3")),
        "USER": os.environ.get("SQL_USER_SURVEY", "user"),
        "PASSWORD": os.environ.get("SQL_PASSWORD_SURVEY", "password"),
        "HOST": os.environ.get("SQL_HOST_SURVEY", "localhost"),
        "PORT": os.environ.get("SQL_PORT_SURVEY", "5432"),
    }
}

# Password validation
# https://docs.djangoproject.com/en/2.2/ref/settings/#auth-password-validators

AUTH_PASSWORD_VALIDATORS = [
    {
        'NAME': 'django.contrib.auth.password_validation.UserAttributeSimilarityValidator',
    },
    {
        'NAME': 'django.contrib.auth.password_validation.MinimumLengthValidator',
    },
    {
        'NAME': 'django.contrib.auth.password_validation.CommonPasswordValidator',
    },
    {
        'NAME': 'django.contrib.auth.password_validation.NumericPasswordValidator',
    },
]

REST_FRAMEWORK = {
    'DEFAULT_AUTHENTICATION_CLASSES': [
        'rest_framework.authentication.BasicAuthentication',
        'rest_framework.authentication.SessionAuthentication',
    ],
    'DEFAULT_SCHEMA_CLASS': 'rest_framework.schemas.coreapi.AutoSchema',
    # 'DEFAULT_RENDERER_CLASSES': [
    #     'rest_framework.renderers.JSONRenderer',
    #     'rest_framework.renderers.AdminRenderer',
    #     'rest_framework.renderers.BrowsableAPIRenderer'
    # ],
    # 'DEFAULT_PAGINATION_CLASS': 'rest_framework.pagination.PageNumberPagination',
    # 'PAGE_SIZE': 100
}

LOGIN_REDIRECT_URL = '/api/v1/api-admin/'

# Internationalization
# https://docs.djangoproject.com/en/2.2/topics/i18n/

# LANGUAGE_CODE = 'en-us'
LANGUAGE_CODE = 'ru-ru'

# TIME_ZONE = 'UTC'
TIME_ZONE = 'Europe/Moscow'

USE_I18N = True

USE_L10N = True

USE_TZ = True


# Static files (CSS, JavaScript, Images)
# https://docs.djangoproject.com/en/2.2/howto/static-files/

STATIC_ROOT = os.path.join(BASE_DIR, 'static')
# STATIC_ROOT = '/static'
STATIC_URL = '/static/'

CORS_ORIGIN_WHITELIST = [
    "http://localhost:8000",
    "http://127.0.0.1:8000",
    "http://localhost:8888",
    "http://127.0.0.1:8888"
]

INTERNAL_IPS = [
    'localhost',
    '127.0.0.1',
]


# -------------------------------------------------
# -------------------------------------------------
# -------------------------------------------------
# -------------------------------------------------
# DATABASES = {
#     'default': {
#         'ENGINE': 'django.db.backends.sqlite3',
#         'NAME': os.path.join(BASE_DIR, 'db.sqlite3'),
#     }
# }
# -------------------------------------------------
# LOGIN_REDIRECT_URL = 'api:login'
# LOGIN_REDIRECT_URL = 'index:api.index'
# LOGIN_REDIRECT_URL = 'api/v1/admin/question/'
# LOGIN_REDIRECT_URL = '../../api-admin/'
# ---------------------------------------

# DATABASES = {
#     "default": {
#         # "ENGINE": 'django.db.backends.postgresql',
#         "ENGINE": 'django.db.backends.postgresql_psycopg2',
#         "NAME": 'postgres',
#         "USER": 'postgres',
#         "PASSWORD": 'postgres',
#         # "HOST": 'db',
#         "HOST": '192.168.0.244',
#         "PORT": "5432",
#     }
# }
# --------------/etc/environment-----------------------------------
# SQL_ENGINE='django.db.backends.postgresql_psycopg2'
# SQL_DATABASE_SURVEY='surveybd'
# SQL_USER_SURVEY='marat'
# SQL_PASSWORD_SURVEY='091973psql16'
# SQL_HOST_SURVEY='127.0.0.1'
# SQL_PORT_SURVEY='5432'
# -------------------------------------------------


# print('==== DATABASES ====', DATABASES)

# -------------------------------------------------
