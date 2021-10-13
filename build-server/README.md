# Setup Instructions
1. create new client in auth server
   1. by now you should be able to, scopes: `openid profile`
2. replace capitalized values inside `.env`, note:
3. place the same domain as entered on top of the `.env` file inside the docker-compose file
   at `traefik.http.routers.build-server.rule`
4. start the auth-server: `docker-compose up -d`
5. check that the system is up and running without errors: `docker-compose logs`
6. open BUILD_PUBLIC_URL`/auth/login` in your browser and verify you can log in using your university id and
   password

# Create Image for Course
tbd.
