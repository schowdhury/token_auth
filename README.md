## How to Glug it

### Create an account

http://localhost:3000/users/sign_up

### Get a token

POST http://localhost:3000/api/tokens?format=json

with parameters:

email: EMAIL

password: PASSWORD

Result is a token

### Make requests with auth_token

http://localhost:3000/api/test

with parameter:

auth_token: token

### To delete the token:

call HTTP DELETE to URL

http://localhost:3000/api/tokens/TOKEN

