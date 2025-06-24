# 5. README.md
# ========================================

# 🔄 N8N Workflow - Manual de Mantenimiento Bot

Orquestador que conecta Telegram Bot con la API RAG del Manual de Mantenimiento.

## 🏗️ Arquitectura

```
Telegram → N8N (Render) → FastAPI (Render) → Qdrant Cloud → Groq
```

## 🚀 Deploy en Render

### 1. Configuración Automática
- Render detecta `render.yaml` automáticamente
- Docker build con N8N pre-configurado
- Variables de entorno auto-configuradas

### 2. Variables Requeridas
En Render dashboard, configurar:
```
TELEGRAM_BOT_TOKEN=123456789:ABCDEF...
RAG_API_URL=https://manual-mantenimiento-api.onrender.com
```

### 3. Acceso a N8N
- **URL**: https://n8n-manual-bot.onrender.com
- **Usuario**: admin  
- **Password**: (generado automáticamente por Render)

## 🔧 Configuración Post-Deploy

### 1. Importar Workflow
1. Acceder a N8N web interface
2. **Settings** → **Import workflow**
3. Subir `workflow.json`
4. Activar workflow

### 2. Configurar Webhook de Telegram
```bash
curl -X POST "https://api.telegram.org/botTU_BOT_TOKEN/setWebhook" \
  -H "Content-Type: application/json" \
  -d '{"url": "https://n8n-manual-bot.onrender.com/webhook/webhook-telegram"}'
```

### 3. Probar el Sistema
- Enviar `/start` al bot en Telegram
- Hacer consulta: "¿Cómo mantener aspiradoras?"
- Verificar respuesta con imágenes del manual

## 📊 Funcionalidades

### Comandos Soportados
- `/start` - Bienvenida y instrucciones
- `/help` - Ayuda y ejemplos
- `/sections` - Secciones del manual

### Detección Automática de Secciones
- **EPP/Seguridad**: "¿Qué EPP usar?"
- **Equipos**: "mantenimiento aspiradoras"
- **Sistemas Mecánicos**: "aire acondicionado gotea"
- **Reparaciones**: "quitar óxido metal"

### Respuestas Inteligentes
- Texto contextualizado del manual
- Imágenes reales del PDF
- Referencias a páginas específicas
- Tiempo de procesamiento

## 🔍 Monitoreo

### Health Checks
- N8N: `https://n8n-manual-bot.onrender.com/healthz`
- API: `https://manual-mantenimiento-api.onrender.com/health`

### Logs y Debugging
- **N8N Interface**: Executions → Ver logs detallados
- **Render Dashboard**: Logs en tiempo real
- **Telegram**: @BotFather para analytics

## 🛠️ Mantenimiento

### Cold Starts
- Render duerme después de 15min inactividad
- Primera consulta puede tomar 30-60s
- Consultas siguientes: <3s

### Actualizaciones
- Push a GitHub → Auto-deploy en Render
- Workflow updates → Via N8N interface
- Variables → Render dashboard

## 🔒 Seguridad

- N8N protegido con autenticación básica
- Telegram Bot Token en variables de entorno
- HTTPS obligatorio en todas las conexiones
- Logs no incluyen tokens sensibles
