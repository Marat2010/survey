FROM  postgres:12.6-alpine

# Для востановления дампа, при поднятии контейнера:
# (чтобы не создавать суперпользоватяля для django)

# ADD ./backup/DB.sql /docker-entrypoint-initdb.d
ADD ./backup/DB.sql /docker-entrypoint-initdb.d

