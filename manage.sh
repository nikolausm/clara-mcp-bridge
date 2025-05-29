#!/bin/bash

# MCP Bridge Management Script für Clara

GREEN='\033[0;32m'
RED='\033[0;31m'
YELLOW='\033[1;33m'
NC='\033[0m'

print_header() {
    echo -e "${GREEN}==================================${NC}"
    echo -e "${GREEN}MCP Bridge für Clara${NC}"
    echo -e "${GREEN}==================================${NC}"
}

start_services() {
    echo -e "\n${YELLOW}Starte MCP Services...${NC}"
    
    # Stoppe alte Container falls vorhanden
    docker-compose down 2>/dev/null
    
    # Starte nur die NPX-basierten Services
    docker-compose up -d desktop-commander azure-devops github home-assistant email
    
    echo -e "\n${GREEN}NPX-basierte Services gestartet!${NC}"
    
    # Zeige Status
    sleep 3
    docker ps --format "table {{.Names}}\t{{.Status}}" | grep mcp_
}

stop_services() {
    echo -e "\n${YELLOW}Stoppe MCP Services...${NC}"
    docker-compose down
}

status() {
    echo -e "\n${YELLOW}MCP Services Status:${NC}"
    docker ps --format "table {{.Names}}\t{{.Status}}\t{{.Ports}}" | grep mcp_ || echo "Keine MCP Services laufen"
}

case "$1" in
    start)
        print_header
        start_services
        ;;
    stop)
        print_header
        stop_services
        ;;
    status)
        print_header
        status
        ;;
    *)
        print_header
        echo "Usage: $0 {start|stop|status}"
        exit 1
        ;;
esac
