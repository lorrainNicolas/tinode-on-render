# Utilise l'image officielle Tinode
FROM tinode/tinode:latest

# Définit le répertoire de travail
WORKDIR /app

# Copie ta configuration Tinode
COPY config.json /app/config.json

# Expose le port Render (Render impose sa variable $PORT)
EXPOSE 10000

# Commande de démarrage
# On remplace ${PORT} dans la config puis on lance Tinode
CMD sed -i "s/\${PORT}/${PORT}/g" /app/config.json && /usr/local/bin/tinode -config /app/config.json
