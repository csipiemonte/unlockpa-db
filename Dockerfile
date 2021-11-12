FROM postgres:9.6.23

COPY ./sql/ /docker-entrypoint-initdb.d/
RUN chmod -R ugo+rX /docker-entrypoint-initdb.d

