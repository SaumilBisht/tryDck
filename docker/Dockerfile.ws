FROM oven/bun:1

WORKDIR /usr/src/app

COPY ./package.json ./package.json
COPY ./turbo.json ./turbo.json
COPY ./packages ./packages
COPY ./bun.lock ./bun.lock
COPY ./apps/ws ./apps/ws

COPY . .

RUN bun install
RUN bun run db:generate

EXPOSE 8081

CMD ["bun","run","start:ws"]
