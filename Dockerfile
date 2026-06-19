# ViaLumen Paymaster lab image (published to ghcr.io)
FROM node:20-slim
WORKDIR /app
COPY package.json ./
RUN npm install --omit=dev --no-audit --no-fund
COPY src ./src
COPY contracts ./contracts
ENV SEPOLIA_RPC=https://ethereum-sepolia-rpc.publicnode.com
CMD ["node", "src/paymaster-lab.mjs"]
