# Setup Instructions

1. place your email inside the docker-compose file at `certificatesresolvers.https_resolver.acme.email`
2. start traefik: `docker-compose up -d`
3. check that the system is up and running without errors: `docker-compose logs`