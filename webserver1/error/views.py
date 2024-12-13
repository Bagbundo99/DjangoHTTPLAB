from django.shortcuts import render
from django.http import HttpResponse,HttpResponseNotFound
from django.shortcuts import redirect

import os
websitename = os.environ.get("WEBSITE1")

# Create your views here.
def cors(request):
    response = redirect(websitename)
    response.status_code=308
    return response