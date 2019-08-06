from rest_framework.exceptions import APIException

class MissingQueryParameterException(APIException):
    status_code = 400
    default_detail = 'Query Parameters missing. Please check again'
    default_code = 'missing_query_param'
