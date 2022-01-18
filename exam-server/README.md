# Setup Instructions

1. create new client in auth server (as before)
    1. name: exam
    2. scopes: openid profile
    3. callback: EXAM_PUBLIC_URL `/auth/callback`
2. replace capitalized values inside `.env`, note:
3. place the same domain as entered on top of the `.env` file inside the docker-compose file
   at `traefik.http.routers.exam-server.rule`
4. start the auth-server: `docker-compose up -d`
5. check that the system is up and running without errors: `docker-compose logs`

# Usage
Place all files that the student should have when starting the exam inside the skel folder.
It is possible the contents of that folder without restarting the server!
