#!/bin/bash

echo "=== Verification MongoDB ==="

if ! docker ps | grep tp1-Devops > /dev/null; then
  echo "Erreur: Conteneur tp1-Devops ne tourne pas"
  exit 1
fi
echo "[OK] Conteneur actif"

docker exec tp1-Devops mongosh -u admin -p password123 --authenticationDatabase admin --eval "db.getSiblingDB('blog_db').posts.countDocuments()" | grep -q "5"
if [ $? -ne 0 ]; then
  echo "Erreur: Acces a la base de donnees echoue"
  exit 1
fi
echo "[OK] Base de donnees accessible"

USER=$(docker exec tp1-Devops whoami)
if [ "$USER" != "mongodb" ]; then
  echo "Erreur: Utilisateur $USER (doit etre mongodb)"
  exit 1
fi
echo "[OK] Utilisateur: $USER"

echo ""
echo "Tous les tests passent"