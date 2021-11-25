"""survey URL Configuration

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/2.2/topics/http/urls/

"""
from django.contrib import admin
from django.urls import path, include
from .views import redirect_to
import debug_toolbar
from .yasg import urlpatterns as doc_urls
# from survey.api.urls import router
# from api.urls import router


urlpatterns = [
    path('', redirect_to),
    path('api/v1/', include('api.urls')),
    path('admin/', admin.site.urls),
    path('__debug__/', include(debug_toolbar.urls)),

    path('mytest/', include('my_test.urls')),  # For my test

]

urlpatterns += doc_urls


# if settings.DEBUG:
#     # import debug_toolbar
#
#     urlpatterns = [
#         path('__debug__/', include(debug_toolbar.urls)),
#     ]

# urlpatterns += static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT)


# ---------------------------------------------------
# ---------------------------------------------------
# path('accounts/profile/', include('router.urls')),
# path('accounts/profile/', include(router.urls), { 'next_page' : '/' } ),

# path('', include('api.urls')),
