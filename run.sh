#!/bin/bash

# Get hostname from current host
HOSTNAME=$(hostname)

# Define path to docker-compose
DOCKER_COMPOSE_FILE="docker-compose.yml"

# Define temp-file
TEMP_FILE=$(mktemp)

# Define absolute path to docker-compose binary file
DOCKER_COMPOSE=/usr/local/bin/docker-compose

# Replace hostname value in docker-compose.yml
sed -i "s/example.com/$HOSTNAME/g" "$DOCKER_COMPOSE_FILE" > "$TEMP_FILE"

# Run changed docker-compose with updated hostname
sudo "$DOCKER_COMPOSE" -f "$TEMP_FILE" up -d --build

# Remove temp file
rm -f "$TEMP_FILE"