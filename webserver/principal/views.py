from django.shortcuts import render
from django.http import HttpResponse
import random
from django.views.decorators.csrf import csrf_exempt


# Create your views here.
def index(request):
    return render(request, 'index.html')

@csrf_exempt
def cookie(request):
    response = HttpResponse(status=200)
    if request.method == "POST" and request.COOKIES.get("Cookie") is  None:
       cookies= ["White Chocolate Strawberry Cookie","Pineapple Semi-Sweet Cookie","Chewy Chocolate Chip Cookie","White Chocolate Macadamia Nut Cookie","Peanut Butter Blossom","Soft Chewy Oatmeal Raisin Cookie"]
       response.set_cookie("Cookie",value=random.choice(cookies),domain="nachosite.com")
    return response

def card(request):
    return render(request, 'card.html')