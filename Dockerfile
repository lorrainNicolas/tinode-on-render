FROM tinode/tinode:latest

WORKDIR /app

COPY config.json /app/config.json

EXPOSE 10000

# Supprime l'entrypoint original
ENTRYPOINT []

# Remplace ${PORT} et lance Tinode
CMD sed -i "s/\${PORT}/${PORT}/g" /app/config.json && /usr/local/bin/tinode -config /app/config.json
