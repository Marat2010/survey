from django.urls import path
from rest_framework import permissions
from drf_yasg2.views import get_schema_view
from drf_yasg2 import openapi


schema_view = get_schema_view(
   openapi.Info(
      title="Django Survey API",
      default_version='v1',
      description="Test description",
      license=openapi.License(name="BSD License"),
   ),
   public=True,
   permission_classes=(permissions.AllowAny,),
)

urlpatterns = [
   path(r'swagger(^?P<format>\.json|\.yaml)', schema_view.without_ui(cache_timeout=0), name='schema-json'),
   path('swagger/', schema_view.with_ui('swagger', cache_timeout=0), name='schema-swagger-ui'),
   path('redoc/', schema_view.with_ui('redoc', cache_timeout=0), name='schema-redoc'),
]

# -----------------------------------------------------
# from rest_framework_swagger.views import get_swagger_view
# from django.conf.urls import url
#
# schema_view = get_swagger_view(title='Pastebin API')
#
# urlpatterns = [
#     url(r'^$', schema_view)
# ]
# -----------------------------------------------------------
# path(r'swagger(<int:format>\.json|\.yaml)', schema_view.without_ui(cache_timeout=0), name='schema-json'),
# -----------------------------------------------------------
