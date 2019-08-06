#! /bin/sh

SITE_BASE_URL="https://guarded-reaches-45302.herokuapp.com"

echo "Logging in using the demo user credentials and fetching JWT token: \n"

# The demo username and password are hardcoded here so that we can give a demo
# of how to fetch a token using curl.
USERNAME="sanyem"
PASSWORD="sanyem"

echo "The username is: $USERNAME"
echo "The password is: $PASSWORD"

token_res=`curl -s -X POST "$SITE_BASE_URL/api-token-auth/" -H "accept: application/json" -H "Content-Type: application/json" -d "{ \"username\": \"$USERNAME\", \"password\": \"$PASSWORD\"}"`

token=`echo $token_res | python -c 'import json,sys;obj=json.load(sys.stdin);print(obj["token"])'`
echo "\ntoken: $token\n"

IFSC_code="IDIB000R029"
echo "Searching for bank with IFSC code -> $IFSC_code\n"
ifsc_res=`curl -s -X GET "$SITE_BASE_URL/server/$IFSC_code/" -H "accept: application/json" -H "Authorization: JWT $token"`

echo $ifsc_res | python -m json.tool


# Sample values for limit, offset, bank, city
limit=10
offset=0
bank="BANK OF BARODA"
city="MUMBAI"
name_city=`curl -G -s -X GET "$SITE_BASE_URL/server/" -H "accept: application/json" \
                            --data-urlencode "bank_name=$bank" --data-urlencode "city=$city" \
                            --data-urlencode "offset=$offset" --data-urlencode "limit=$limit" \
                            -H "Authorization: JWT $token"`

echo "The data entered is: limit=$limit offset=$offset bank=$bank city=$city\n"
echo $name_city | python -m json.tool


offset=10
echo "Data: limit=$limit offset=$offset bank=$bank city=$city\n"
name_city_2=`curl -G -s -X GET "$SITE_BASE_URL/server/" -H "accept: application/json" \
                            --data-urlencode "bank_name=$bank" --data-urlencode "city=$city" \
                            --data-urlencode "offset=$offset" --data-urlencode "limit=$limit" \
                            -H "Authorization: JWT $token"`
echo $name_city_2 | python -m json.tool

