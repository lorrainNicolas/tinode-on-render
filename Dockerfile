# Utilise l'image officielle Tinode
FROM tinode/tinode:latest

# Expose le port utilisé par Tinode
EXPOSE 6060

# Commande par défaut pour démarrer Tinode
CMD ["tinode"]