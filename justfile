set shell := ["bash", "-cu"]

# Verify required tools
install:
    command -v java
    command -v javac
    command -v docker
    command -v git

    ./mvnw dependency:resolve

# Start infrastructure
db-up:
    docker compose up -d

# Stop infrastructure
db-down:
    docker compose down

# Show running containers
ps:
    docker compose ps

# Follow postgres logs
db-logs:
    docker compose logs -f postgres

# Open postgres shell
db:
    docker exec -it workflow-postgres psql -U workflow -d workflow

# Run application locally
start:
    ./mvnw spring-boot:run

# Build application
build:
    ./mvnw clean package

# Run tests
test:
    ./mvnw test

# Clean target directory
clean:
    ./mvnw clean

# Full local startup
dev:
    docker compose up -d
    ./mvnw spring-boot:run

# Full shutdown
stop:
    docker compose down