FROM node:18-alpine

WORKDIR /app

# Copy the existing bondora server
COPY --from=host /Users/michaelnikolaus/bondora-mcp-server/dist ./dist
COPY --from=host /Users/michaelnikolaus/bondora-mcp-server/package*.json ./

# Install dependencies
RUN npm ci --only=production

CMD ["node", "dist/index.js"]
