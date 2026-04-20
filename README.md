# MongoDB Blog Docker

## Build

docker build -t gln/mongo_blog:1.0.0 .

## Run

docker run -d \
  --name tp1-Devops \
  -e MONGO_INITDB_ROOT_USERNAME=admin \
  -e MONGO_INITDB_ROOT_PASSWORD=password123 \
  -p 27017:27017 \
  gln/mongo_blog:1.0.0

## Check

./check-status.sh

## Posts

docker exec tp1-Devops mongosh -u admin -p password123 --authenticationDatabase admin --eval "db.getSiblingDB('blog_db').posts.find().pretty()"

## Test validation (doit echouer)

docker exec tp1-Devops mongosh -u admin -p password123 --authenticationDatabase admin --eval "db.getSiblingDB('blog_db').posts.insertOne({titre: 123, auteur: 'Test', vues: 100})"

## Push

docker login
docker push gln/mongo_blog:1.0.0