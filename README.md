# Fyle Backend Coding Task


Essentials your applications should have: 

- use PostgreSQL as a backend database
- GET API to fetch a bank details, given branch IFSC code
- GET API to fetch all details of branches, given bank name and a city
- each API should support limit & offset parameters
- APIs should be authenticated using a JWT key, with validity = 5 days.

Deliverables: 
- Hosting URL 
- Github repo link to your solution
- please include a curl script that makes a call to each of the above mentioned APIs(which includes the JWT key) in your repo while demonstrating the limit and offset parameters
- Time taken to complete this exercise

Feel free to reach out to us if you have any questions.

##LINK
- Host URL: https://guarded-reaches-45302.herokuapp.com

## Tech Stack

- WebFramework: Django
- Language: python

## SAMPLE URLS
-  Admin Panel: https://guarded-reaches-45302.herokuapp.com/admin/
- API for Bank by IFSC code: https://guarded-reaches-45302.herokuapp.com/server/IDIB000R029
- API for Branch by Bank and City: https://guarded-reaches-45302.herokuapp.com/server?bank_name=BANK%20OF%20BARODA&city=MUMBAI
- JWT TOKEN AUTHENTICATION: https://guarded-reaches-45302.herokuapp.com/api-token-auth/
- JWT TOKEN REFRESH: https://guarded-reaches-45302.herokuapp.com/api-token-refresh/