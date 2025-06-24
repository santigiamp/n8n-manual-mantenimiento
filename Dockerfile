# ========================================
# Dockerfile - N8N Minimal Working Version
# ========================================

FROM n8nio/n8n:latest

# Variables de entorno mínimas requeridas
ENV N8N_HOST=0.0.0.0
ENV N8N_PORT=$PORT
ENV NODE_ENV=production
ENV N8N_PROTOCOL=https
ENV N8N_ENFORCE_SETTINGS_FILE_PERMISSIONS=false

# La imagen base ya tiene ENTRYPOINT configurado
# No necesitamos CMD personalizado
