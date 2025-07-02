FROM oven/bun:1

WORKDIR /usr/src/app


RUN apt-get update -y && apt-get install -y openssl

COPY ./package.json ./package.json
COPY ./turbo.json ./turbo.json
COPY ./bun.lock ./bun.lock


RUN bun install

COPY ./apps/ws ./apps/ws
COPY ./packages ./packages
COPY . .

RUN bun run db:generate

EXPOSE 8081

CMD ["bun","run","start:ws"]
