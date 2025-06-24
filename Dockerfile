# ========================================
# Dockerfile - N8N Fixed Version
# ========================================

FROM n8nio/n8n:latest

USER root

# Crear directorio de configuración con permisos correctos
RUN mkdir -p /home/node/.n8n && \
    chown -R node:node /home/node/.n8n && \
    chmod 700 /home/node/.n8n

USER node

# Variables de entorno
ENV N8N_HOST=0.0.0.0
ENV N8N_PORT=$PORT
ENV NODE_ENV=production
ENV N8N_PROTOCOL=https
ENV N8N_ENFORCE_SETTINGS_FILE_PERMISSIONS=true
ENV N8N_USER_FOLDER=/home/node/.n8n

# Crear directorio de datos
RUN mkdir -p /home/node/.n8n

# Usar la ruta completa de n8n
CMD ["/usr/local/bin/node", "/usr/local/lib/node_modules/n8n/bin/n8n", "start"]
