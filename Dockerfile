# ========================================
# Dockerfile - N8N Simple Port Fix
# ========================================

FROM n8nio/n8n:latest

# Variables de entorno básicas
ENV N8N_HOST=0.0.0.0
ENV NODE_ENV=production
ENV N8N_PROTOCOL=https
ENV N8N_ENFORCE_SETTINGS_FILE_PERMISSIONS=false

# No establecer N8N_PORT aquí - usar variable de Render
