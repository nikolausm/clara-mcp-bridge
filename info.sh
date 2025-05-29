#!/bin/bash

echo "=== MCP Docker Setup für Ihre installierten Server ==="
echo ""
echo "Folgende Server werden als Docker Container eingerichtet:"
echo "✓ Desktop Commander (@wonderwhy-er/desktop-commander)"
echo "✓ Azure DevOps (@tiberriver256/mcp-server-azure-devops)"
echo "✓ GitHub (@modelcontextprotocol/server-github)"
echo "✓ Home Assistant (voska/hass-mcp)"
echo ""
echo "Die lokalen Server bleiben unverändert:"
echo "- Bondora (läuft weiter unter /Users/michaelnikolaus/bondora-mcp-server)"
echo "- Home Connect (läuft weiter unter /Users/michaelnikolaus/Desktop/mcp-server-home-connect)"
echo "- Knowledge (läuft weiter unter /Users/michaelnikolaus/mcp-knowledge-server)"
echo "- Email (Python-basiert)"
echo ""

# Zeige die bestehenden Container
echo "Aktuelle Docker Container:"
docker ps -a | grep mcp_ || echo "Keine MCP Container gefunden"

echo ""
echo "Die neuen Docker-Container wurden vorbereitet in:"
echo "/Users/michaelnikolaus/clara-mcp-bridge-new"
echo ""
echo "Sie können die NPX-basierten Server jetzt testen mit:"
echo "cd /Users/michaelnikolaus/clara-mcp-bridge-new"
echo "docker-compose -f docker-compose-simple.yml up -d"
