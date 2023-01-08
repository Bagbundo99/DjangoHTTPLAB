from django.shortcuts import render
from django.http import HttpResponse,HttpResponseNotFound
from django.shortcuts import redirect

# Create your views here.

    


    

def cors(request):
    response = redirect('http://principal.nachosite.com')
    response.status_code=308
    return response