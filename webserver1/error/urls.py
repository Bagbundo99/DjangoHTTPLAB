from django.urls import path
from .views import cors
from django.conf import settings
from django.conf.urls.static import static

urlpatterns = [
               path('cors',cors,name='cors'),]
if settings.DEBUG:
    urlpatterns += static(settings.MEDIA_URL,
                          document_root=settings.MEDIA_ROOT)
