from django.shortcuts import render, get_object_or_404
from rest_framework import generics
from rest_framework.decorators import action
from .errors import MissingQueryParameterException
from .models import Banks, Branches
from .serializers import BankSerializer, BranchSerializer


class BranchByIFSC(generics.RetrieveAPIView):
    serializer_class = BranchSerializer
    def get_object(self):
        ifsc = self.kwargs.get('ifsc', None)
        if ifsc is None:
            raise MissingQueryParameterException(
                detail='Could not find the IFSC code')

        return get_object_or_404(Branches, ifsc=ifsc)

class BranchByCityBank(generics.ListAPIView):
    serializer_class = BranchSerializer
    def get_queryset(self):
        city = self.request.query_params.get('city')
        bank_name = self.request.query_params.get('bank_name')
        if city is None and bank_name is None:
            raise MissingQueryParameterException(
                detail='Could not find the city and Bank Name')
        results = None
        if city:
            final_ans = Branches.objects.filter(city=city)
        if bank_name:
            final_ans = final_ans.filter(bank__name=bank_name)
        return final_ans
    def get(self, request, *args, **kwargs):
        return super().get(request, *args, **kwargs)


