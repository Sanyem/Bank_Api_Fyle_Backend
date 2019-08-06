from django.urls import path

from .views import *

urlpatterns = [
    path('<slug:ifsc>/', BranchByIFSC.as_view()),
    path('', BranchByCityBank.as_view()),
]
