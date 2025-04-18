# Utilise l'image officielle de Python
FROM python:3.10-slim

# Définit les variables d'environnement
ENV PYTHONDONTWRITEBYTECODE=1 \
    PYTHONUNBUFFERED=1 \
    DJANGO_SETTINGS_MODULE=medical.settings \
    DJANGO_DEBUG=False

# Crée un utilisateur non-root
RUN useradd -m appuser && \
    mkdir /app && \
    chown appuser:appuser /app

# Définit le répertoire de travail
WORKDIR /app

# Copie les fichiers de dépendances
COPY requirements.txt .

# Met à jour pip et installe les dépendances
RUN pip install --no-cache-dir --upgrade pip && \
    pip install --no-cache-dir -r requirements.txt

# Copie le code du backend dans le conteneur
COPY . /app/

# Change les permissions
RUN chown -R appuser:appuser /app

# Change vers l'utilisateur non-root
USER appuser

# Expose le port 8000
EXPOSE 8000

# Démarre le serveur Django avec gunicorn
CMD ["gunicorn", "--bind", "0.0.0.0:8000", "--workers", "3", "--timeout", "120", "medical.wsgi:application"]
