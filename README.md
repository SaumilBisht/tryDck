# 🧩 Fullstack App — Dockerized

A fullstack web application with:

- ⚙️ Backend (Express)
- 🖥️ Frontend (Next.js + Bun + Prisma)
- 🔌 WebSocket server
- 🐘 PostgreSQL (via Docker)

Everything is containerized using **Docker Compose**, so setup is simple and fast.

---

## 🚀 Quick Start (with Docker Compose)

### 📦 Prerequisites

- [Docker](https://www.docker.com/products/docker-desktop) installed
- Docker Compose (comes with Docker Desktop)

### DOCKER COMPOSE

STEP 1: CLONE REPO
  git clone https://github.com/SaumilBisht/tryDck
  cd tryDck

STEP 2:Build and start all services:

  docker compose up --build


IF, Stop the app:
  docker compose down
  docker compose down --volumes --remove-orphans


### DOCKER 
STEP 0: CLONE REPO
  git clone https://github.com/SaumilBisht/tryDck
  cd tryDck

STEP 1: CREATE NETWORK
  docker network create my_app  

STEP 2: RUN POSTGRES
  docker run -d --name my_postgres -e POSTGRES_PASSWORD=postgres -p 5432:5432 post
gres

STEP 3: BUILD IMAGES
  docker build -t my-frontend -f docker/Dockerfile.fe .
  docker build -t my-backend -f docker/Dockerfile.be .
  docker build -t my-ws -f docker/Dockerfile.ws .

STEP 4: RUN EACH CONTAINER

# Run frontend
docker run -d \
  --name frontend \
  --network my_app \
  -e DATABASE_URL=postgresql://postgres:postgres@postgres:5432/postgres \
  -p 3000:3000 \
  my-frontend

# Run backend
docker run -d \
  --name backend \
  --network my_app \
  -e DATABASE_URL=postgresql://postgres:postgres@postgres:5432/postgres \
  -p 8080:8080 \
  my-backend


# Run WebSocket server
docker run -d \
  --name ws \
  --network my_app \
  -p 8081:8081 \
  my-ws


for frontend still need to migrate dev.
backend still prisma 

