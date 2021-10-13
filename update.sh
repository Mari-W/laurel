echo "updating this repository"
git pull --rebase

read -r -p "make sure that there are no new variables that needed to be placed inside configurations of all services, then press enter"

echo "restarting all services, as well as rebuilding auth and courses server"
echo ""
echo ""

echo "restarting traefik-proxy"
cd traefik-proxy || exit
docker-compose down
docker-compose up -d
cd .. || exit

echo "restarting postgres-sql"
cd postgres-sql || exit
docker-compose down
docker-compose up -d
cd .. || exit

echo "rebuilding auth-server"
cd auth-server || exit
docker-compose down
docker-compose pull
docker-compose up -d --build
cd .. || exit

echo "restarting gitea-exercises"
cd gitea-exercises || exit
docker-compose down
docker-compose up -d
cd .. || exit

# echo "restarting gitea-exams"
# cd gitea-exams || exit
# docker-compose down
# docker-compose up -d
# cd .. || exit

echo "rebuilding courses-server"
cd courses-server || exit
docker-compose down
docker-compose pull
docker-compose up -d --build
cd .. || exit

echo "restarting drone-ci"
cd drone-ci || exit
docker-compose down
docker-compose up -d
cd .. || exit

echo "restarting rocket-chat"
cd rocket-chat || exit
docker-compose down
docker-compose up -d
cd .. || exit

echo "done. fingers crossed nothing broke but you should verify the logs or services online"
