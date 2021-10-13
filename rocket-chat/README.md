# Setup Instructions

1. place the rocket public url inside the docker-compose file at `traefik.http.routers.rocket-chat.rule`
2. start rocket: `docker-compose up -d`
3. verify it's running by checking the logs: `docker-compose logs`
4. first of, I dont like rocket as well, so have fun, as rocket does not have a config file, because why would they?
5. open the public url in your browser to update settings
    1. setup wizard
        1. set up the admin account (setup page 1) as follows:
            1. name: `Laurel`
            2. username: `laurel`
            3. email: `laurel@laurel.lel` (does not have to be valid)
            4. password: ROCKET_PASSWORD (you set this earlier when setting up courses-server)
        2. set up the organisation (setup page 2) as follows (nothing here is really important):
            1. organisation type: `Community`
            2. organisation name: `Department of Programming Languages`
            3. industry: `Education`
            4. size: `1001-4000`
            5. country: `Germany`
            6. website: `https://proglang.informatik.uni-freiburg.de/`
        3. set up the server info (setup page 3) as follows:
            1. site name: `Forum` (or whatever you like)
            2. language: `Default`
            3. server type: `private team`
            4. auto opt in new users for two factor via email: `No`
        4. set up the register server (setup page 4) as follows:
            1. `keep standalone` (!)
            2. do not agree with `terms and services`
    2. change settings (! you need to click save changes in the top right corner after every setting you change !)
        1. go to `Administration` area
        2. go to `Settings -> Omnichannel`
            1. disable `Omnichannel enabled`
        3. go to `Settings -> Accounts`
            1. disable `Allow Username Change`
            2. disable `Allow Email Change`
            3. disable `Allow Password Change for OAuth Users`
            4. disable `Allow Email Notifications`
            5. scroll down to `Two Factor Authentication`
                1. disable `Enable Two Factor Authentication`
            6. scroll further down to `Default User Preferences`
                2. disable `Convert ASCII to Emoji` (important)
            7. scroll even further down to `Login Logs`
                1. enable `Log (on console) failed login attempts`
                2. enable `Show Username on failed login attempts logs`
            8. finally, scroll down to `Registration`
                1. set `Regstration Form` to `Disabled`
                2. set `Registration Form Link Replacement Text` to empty string
            9. click `Save Changes` (top right corner)
        4. register new client on auth server
            1. go to public url of auth server
            2. in `Admin Panel` click `Add`
                1. `Client Name`: `Rocket`
                2. `Client URI`: ROCKET_PUBLIC_URL
                3. `Allowed Scopes`: `openid profile`
                4. `Redirect URIs`: ROCKET_PUBLIC_URL`/_oauth/uni?close`
                5. click `Add`
        5. go to `Settings -> OAuth`
            1. click `Add custom oauth` (top right corner)
            2. name it `uni`
            3. open `Uni`
            4. enable `Enable`
            5. set `URL` to Auth Server's public url
            6. set `Token Sent Via` to `Header`
            7. set `Identity Path` to `/userinfo`
            8. set `Scope` to `openid profile`
            9. set `Id` to the client id (copy from auth server admin panel)
            10. set `Secret` to the client secret (copy from auth server admin panel)
            11. set `Button Text` to `Login with Uni ID` (or whatever you want)
            12. set `Username Field` to `sub`
            13. click `Save Changes` (top right corner)
        6. go to `Settings -> Layout -> Custom Scripts`
            1. set `Custom Script for Logout Flow` to
           ```js
           window.location = "https://COURSES_PUBLIC_URL/auth/logout?redirect=ROCKET_PUBLIC_URL"
           ```
           where you replace the urls accordingly
            1. customize the `Content` and `Colors` etc until you are happy
        7. go to `Administration -> Integrations`
            1. click `New` (top right corner)
            2. select `Outgoing` (top left corner)
            3. set `Event Trigger` to `User Created`
            4. set `Name` to `User Created Hook`
            5. set `Target Room` to `@laurel`
            6. set `URLs` to `http://courses-server:5001/hooks/rocket-user-created`
            7. set `Post as` to `laurel`
            8. scroll down to the end of the page and click `Save`
        8. go to `Settings -> Video Conference`
            1. open `Jitsi`
            2. enable `Enabled`
            3. set `URL room prefix` to `laurel`
            4. enable `Enable for Teams`
            5. enable `Always open in New Window`
            6. click `Save Changes` (top right corner)
        9. final touches
            1. if this log back in with the `laurel` account (not using oauth)
            2. promote your oauth account to admin
                1. go to `Administration -> Users`
                2. click on oauth user
                3. click the `...` (vertical)
                4. click `Make Admin`
            3. go to `Settings -> Accounts`
                1. disable `Show Default Login Form`

# TODO

- get around rockets fucked up permission management so that all channel roles are places automatically
- this also applies to make admins rocket chat admins automatically
