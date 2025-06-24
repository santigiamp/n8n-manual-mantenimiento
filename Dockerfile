# ========================================
# Dockerfile - N8N Working with Correct Port
# ========================================

FROM n8nio/n8n:latest

# Variables de entorno para Render
ENV N8N_HOST=0.0.0.0
ENV N8N_PORT=5678
ENV NODE_ENV=production
ENV N8N_PROTOCOL=https
ENV N8N_ENFORCE_SETTINGS_FILE_PERMISSIONS=false

# Exponer puerto
EXPOSE 5678

# Comando personalizado para usar puerto de Render
CMD ["sh", "-c", "N8N_PORT=${PORT:-5678} n8n start"]
