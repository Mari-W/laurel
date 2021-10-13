# Setup Instructions

1. place all six passwords inside the docker-compose file.
    1. a new password of length (e.g) 24 can be generated using `./../gen_salt.sh 24`
2. place the pgadmin public url inside the docker-compose file at `traefik.http.routers.pgadmin.rule`
3. set up the pgadmin user:
    1. place your email in the environment of the docker-compose file
    2. place a new password in the environment of the docker-compose file
        1. a new password of length (e.g) 24 can be generated using `./../gen_salt.sh 24`
4. start the database: `docker-compose up -d`
5. check that the system is up and running without errors: `docker-compose logs`
6. also verify you can see all databases created inside the webinterface using the new created pgadmin account
    1. open the pgadmin url you just entered inside the docker-compose file in your browser
    2. on first login to pgadmin you need to register the database as follows:
        1. username: admin
        2. password: POSTGRES_PASSWORD
        3. host: laurel-postgres-sql
    3. there should be seven databases