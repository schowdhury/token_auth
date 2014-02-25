Calls:

### Get a token

POST http://localhost:3000/api/tokens?format=json

with parameters:

email: EMAIL

password: PASSWORD

Result is a token

### Make requests with auth_token

Then to test the token is valid, hit:

http://localhost:3000/api/test

with parameter:

auth_token: token

### To delete the token:

call HTTP DELETE to URL

http://localhost:3000/api/tokens/TOKEN

