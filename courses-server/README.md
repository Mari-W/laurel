# Setup Instructions

1. create new client in auth server (as before)
    1. name: courses
    2. scopes: openid profile email
    3. callback: COURSES_PUBLIC_URL`/auth/callback`
2. replace capitalized values inside `.env`, note:
3. place the same domain as entered on top of the `.env` file inside the docker-compose file
   at `traefik.http.routers.courses-server.rule`
4. start the auth-server: `docker-compose up -d`
5. check that the system is up and running without errors: `docker-compose logs`
6. open COURSES_PUBLIC_URL`/auth/login` in your browser and verify you can log in using your university id and password
