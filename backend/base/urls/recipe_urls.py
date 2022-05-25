from django.urls import path

from base.views import recipe_views as views

# from rest_framework_simplejwt.views import TokenObtainPairView

urlpatterns = [

    path('', views.getRecipes, name="recipes"),

]