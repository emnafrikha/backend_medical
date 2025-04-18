# Utilise l'image officielle de Python
FROM python:3.10-slim

# Défini le répertoire de travail
WORKDIR /app

# Copie les fichiers de dépendances
COPY requirements.txt .

# Met à jour pip et installe les dépendances
RUN pip install --no-cache-dir --upgrade pip && \
    pip install --no-cache-dir -r requirements.txt

# Copie le code du backend dans le conteneur
COPY medical/ /app/

# Expose le port 8000
EXPOSE 8000

# Démarre le serveur Django avec gunicorn
CMD ["gunicorn", "--bind", "0.0.0.0:8000", "medical.wsgi:application"]
