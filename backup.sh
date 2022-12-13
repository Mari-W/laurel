#!/usr/bin/env bash

BACKUP_DIR="BACHKUP_DIR"

# postgres
echo "Backing up database.."
# restore: cat your_dump.sql | docker exec -i postgres_postgres_1 psql -U admin
cd postgres-sql
echo "Copying.."
docker exec -t postgres_postgres_1 pg_dumpall -c -U admin > backup_postgres_`date +%d-%m-%Y"_"%H_%M_%S`.sql
echo "Moving.."
mv backup_postgres_*.sql $BACKUP_DIR
cd ..

# gitea
echo "Backing up gitea.."
# restore: rename backup folder to 'data' and place it in gitea-exercise folder
cd gitea-exercises 
echo "Copying.."
cp -r data backup_gitea_`date +%d-%m-%Y"_"%H_%M_%S`
echo "Moving.."
mv backup_gitea_* $BACKUP_DIR
cd ..

echo "Done."