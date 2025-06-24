# ========================================
# 1. Dockerfile
# ========================================

FROM n8nio/n8n:latest

USER root

# Instalar dependencias adicionales si necesario
RUN npm install -g pm2

USER node

# Variables de entorno
ENV N8N_HOST=0.0.0.0
ENV N8N_PORT=$PORT
ENV NODE_ENV=production
ENV N8N_PROTOCOL=https

# Comando de inicio
CMD ["n8n", "start"]
