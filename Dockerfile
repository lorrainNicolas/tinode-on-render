# --- ÉTAPE 1 : Compilation ---
# Utiliser l'image officielle Go pour compiler
FROM golang:1.21-alpine AS builder

# Définir le répertoire de travail
WORKDIR /app

# Cloner le dépôt Tinode
RUN apk add --no-cache git
RUN git clone https://github.com/tinode/tinode-server.git .

# Compiler le binaire Tinode
# L'option -o spécifie le nom du binaire de sortie
RUN go install ./tinode/server/...

# --- ÉTAPE 2 : Image d'exécution finale (légère) ---
FROM alpine:3.18

# Installer les certificats SSL et curl (utile pour déboguer)
RUN apk add --no-cache ca-certificates curl

# Définir le port
EXPOSE 6060

# Copier le binaire Tinode compilé depuis l'étape précédente
COPY --from=builder /go/bin/server /usr/local/bin/tinode

# Copier votre fichier de configuration (doit être dans le même répertoire que le Dockerfile)
#COPY tinode.conf /etc/tinode.conf

# Définir la commande de démarrage
CMD ["tinode", "--config=/etc/tinode.conf"]