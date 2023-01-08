from django.urls import path
from .views import index,cookie,card

# not needed
# app_name = "blog"

urlpatterns = [path("", index, name="index"),
            path('cookie/',cookie,name='cookie'),
            path('card/',card,name="card")]