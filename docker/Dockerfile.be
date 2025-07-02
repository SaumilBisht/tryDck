FROM oven/bun:1

WORKDIR /usr/src/app

# Install OpenSSL for Prisma
RUN apt-get update -y && apt-get install -y openssl

COPY ./package.json ./package.json
COPY ./turbo.json ./turbo.json

COPY ./bun.lock ./bun.lock

RUN bun install

COPY ./packages ./packages
COPY ./apps/backend ./apps/backend
COPY . .

RUN bun run db:generate

EXPOSE 8080

CMD ["bun","run","start:be"]
