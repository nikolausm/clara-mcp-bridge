# Clara MCP Bridge

Docker-basierte MCP (Model Context Protocol) Server Integration für Clara AI.

## Übersicht

Dieses Projekt stellt MCP-Server als Docker Container bereit, die mit Clara AI und anderen MCP-kompatiblen Clients verwendet werden können.

## Verfügbare MCP Server

### Docker-basierte Server
- **Desktop Commander** - Dateisystem-Operationen und Code-Verwaltung
- **Azure DevOps** - Integration mit Azure DevOps
- **GitHub** - Repository-Management und Collaboration
- **Home Assistant** - Smart Home Steuerung

### Lokale Server (separat installiert)
- Bondora - Investment Management
- Home Connect - Hausgeräte-Steuerung
- Knowledge - Wissensdatenbank
- Email - E-Mail Verwaltung

## Installation

1. Repository klonen:
```bash
git clone https://github.com/nitr0n/clara-mcp-bridge.git
cd clara-mcp-bridge
```

2. Umgebungsvariablen konfigurieren:
```bash
cp .env.example .env
# Bearbeiten Sie .env und fügen Sie Ihre API-Keys ein
```

3. Docker Container starten:
```bash
docker-compose -f docker-compose-simple.yml up -d
```

## Konfiguration

### Umgebungsvariablen
Erstellen Sie eine `.env` Datei mit folgenden Variablen:
- `AZURE_DEVOPS_ORG_URL` - Ihre Azure DevOps Organisation URL
- `AZURE_DEVOPS_PAT` - Azure DevOps Personal Access Token
- `AZURE_DEVOPS_DEFAULT_PROJECT` - Standard-Projekt in Azure DevOps
- `GITHUB_TOKEN` - GitHub Personal Access Token
- `HOME_ASSISTANT_TOKEN` - Home Assistant Long-Lived Access Token

## Verwendung

### Container verwalten
```bash
# Alle Services starten
docker-compose up -d

# Status anzeigen
docker ps | grep mcp_

# Logs anzeigen
docker logs mcp_desktop_commander

# Services stoppen
docker-compose down
```

### Integration mit Clara
Die MCP-Server können über Clara's n8n Integration (http://localhost:5678) verbunden werden.

## Struktur
```
clara-mcp-bridge/
├── docker-compose.yml          # Vollständige Konfiguration
├── docker-compose-simple.yml   # Vereinfachte NPX-basierte Services
├── .env.example               # Beispiel-Umgebungsvariablen
├── manage.sh                  # Management-Script
└── README.md                  # Diese Datei
```

## Sicherheit
- Speichern Sie niemals API-Keys im Repository
- Verwenden Sie immer .env Dateien für sensitive Daten
- Die .gitignore verhindert das versehentliche Committen von Secrets

## Autor
Michael Nikolaus (Minicon eG)

## Lizenz
MIT
