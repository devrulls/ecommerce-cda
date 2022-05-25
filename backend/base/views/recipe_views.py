from rest_framework import status
from rest_framework.decorators import api_view, permission_classes
from rest_framework.permissions import IsAuthenticated, IsAdminUser
from rest_framework.response import Response
from rest_framework_simplejwt.serializers import TokenObtainPairSerializer
from rest_framework_simplejwt.views import TokenObtainPairView


from django.contrib.auth.hashers import make_password
from django.contrib.auth.models import User

from base.models import Recipes
from base.serializer import RecipeSerializer



@api_view(['GET'])
def getRecipes(request):
    recipes = Recipes.objects.all()
    serializer = RecipeSerializer(recipes, many=True)
    return Response(serializer.data)