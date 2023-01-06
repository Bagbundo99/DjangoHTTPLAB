from django.shortcuts import render
from django.http import HttpResponse
import random


# Create your views here.
def index(request):
    return render(request, 'index.html')


def cookie(request):
    response = HttpResponse(status=200)

    if request.COOKIES.get("Cookie") is not None:
       cookies= ["White Chocolate Strawberry Cookie","Pineapple Semi-Sweet Cookie","Chewy Chocolate Chip Cookie","White Chocolate Macadamia Nut Cookie","Peanut Butter Blossom","Soft Chewy Oatmeal Raisin Cookie"]
       response.set_cookie("Cookie",value=random.choice[cookies],domain="*.nachosite.com",)
    return response