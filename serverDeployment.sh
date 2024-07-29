#!/bin/bash

# Replace these with your actual values
GITHUB_USERNAME=""
IMAGE_NAME=""

# Docker login
echo "Logging into ghcr.io..."
docker login ghcr.io -u "$GITHUB_USERNAME" -p "$GITHUB_TOKEN"

# Pull the latest image
echo "Pulling latest image..."
sudo docker pull ghcr.io/"$GITHUB_USERNAME"/"$IMAGE_NAME":latest

# Get the container ID of any container using port 3000
CONTAINER_ID=$(sudo docker ps -q --filter publish=3000)

# Stop the container using port 3000 (if any)
if [ -n "$CONTAINER_ID" ]; then
  echo "Stopping container using port 3000..."
  sudo docker stop "$CONTAINER_ID"
  sudo docker rm "$CONTAINER_ID"
else
  echo "No container found using port 3000"
fi

# Remove stopped containers
echo "Removing stopped containers..."
sudo docker container prune -f

# Remove unused images (except the latest one)
echo "Removing unused images..."
sudo docker image prune -f

# Run the new image
echo "Running the new image..."
sudo docker run -d -p 3000:3000 --name "$IMAGE_NAME" ghcr.io/"$GITHUB_USERNAME"/"$IMAGE_NAME":latest

echo "Deployment complete!"