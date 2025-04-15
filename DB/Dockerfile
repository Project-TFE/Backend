FROM mysql:8.0
ENV MYSQL_ROOT_PASSWORD=rootpassword
ENV MYSQL_DATABASE=ehealth_db
ENV MYSQL_USER=myuser
ENV MYSQL_PASSWORD=mypassword
COPY ./ehealth_db.sql /docker-entrypoint-initdb.d/