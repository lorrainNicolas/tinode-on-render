# Utilise l'image officielle Tinode
FROM tinode/chat:latest

# Copie ta configuration Tinode
COPY config.json /app/config.json

# Définit le répertoire de travail
WORKDIR /app

# Expose le port Render (facultatif mais propre)
EXPOSE 10000

# Commande de démarrage
# On remplace ${PORT} dans le config.json par la vraie valeur de $PORT donnée par Render
CMD sed -i "s/\${PORT}/${PORT}/g" /app/config.json && tinode
