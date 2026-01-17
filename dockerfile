FROM dhi.io/node:24-alpine3.22-dev AS builder

WORKDIR /app

COPY package.json package-lock.json* ./
RUN --mount=type=cache,target=/root/.npm npm ci

COPY . .

RUN npm run build

EXPOSE 4200