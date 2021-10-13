# Setup Instructions

1. make sure `.env` has `o+x` permissions: `chmod o+x .env`
2. replace capitalized values inside `.env`, note:
    1. ADMINS should be lowered case university ids, updates to ADMINS are only applied on server
       restarts: `docker-compose down && docker-compose up -d`
    2. AUTH_ADMIN_KEY can also be used as password to hijack accounts, create dummy test accounts or used as api key as
       Authorization header
    3. AUTH_PASS inside the SQLALCHEMY_DATABASE_URI key's value should be the password you generated for the auth-server
       while setting up the database
    4. Optionally you can enter some telegram bot token and chat id for error notifications to your phone
3. place the same domain as entered on top of the `.env` file inside the docker-compose file
   at `traefik.http.routers.auth-server.rule`
4. start the auth-server: `docker-compose up -d`
5. check that the system is up and running without errors: `docker-compose logs`
6. open the url you assigned the auth server in your browser and verify you can log in using your university id and
   password