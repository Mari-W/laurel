# Setup Instructions

1. replace all capitalized values (not keys) inside:
    1. app.ini
    2. docker-compose.yml
    3. templates/base/head_navbar.tmpl at the bottom of the pagey
    4. new passwords/secrets of length (e.g) 24 can be generated using `./../gen_salt.sh 24`
2. start gitea: `docker-compose up -d`
3. create new admin user:
    1. `docker-compose exec --user git gitea-exercises bash`
    2. `gitea admin user create --username laurel --password PASsWORD --email laurel@laurel.lel --admin`
    3. a new password of length (e.g) 24 can be generated using `./../gen_salt.sh 24`
    4. keep the password!
4. create a new oauth authentication source
    4. register new client on auth server
        1. go to public url of auth server
        2. in `Admin Panel` click `Add`
        1. `Client Name`: `Gitea Exercises`
        2. `Client URI`: GITEA_EXERCISES_PUBLIC_URL
        3. `Allowed Scopes`: `openid profile email`
        4. `Redirect URIs`: GITEA_EXERCISES_PUBLIC_URL`/oauth/uni/callback`
        5. click `Add`
5. login to gitea using this url: GITEA_EXERCISES_PUBLIC_URL/auth/login
   1. login using the admin account you just created
6. go to `Site Administration -> Authentication Sources` (top left)
   1. Click `Add Authentication Source`
      1. `Authentication Type`: `OAuth2`
      2. `Authentication Name`: `uni`
      3. `OAuth2 Provider`: `OpenID Connect`
      4. `Client ID`: The client ID, copy from auth server
      5. `Client Secret`: The client Secret, copy from auth server
      6. `OpenID Connect Auto Discovery URL`: AUTH_PUBLIC_URL`/.well-known/openid-configuration`
      7. Click `Add Authentication Source`
