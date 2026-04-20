FROM mongo:6.0.16

ENV MONGO_INITDB_ROOT_USERNAME=admin
ENV MONGO_INITDB_ROOT_PASSWORD=password123
ENV MONGO_INITDB_DATABASE=blog_db

COPY init-mongo.js /docker-entrypoint-initdb.d/

USER mongodb

EXPOSE 27017