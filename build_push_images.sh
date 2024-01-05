#!/bin/bash

# Docker Hub username
username="macharavikishore"

# List of image names
image_names=("web" "mongodb" "mysql" "payment" "ratings" "redis" "shipping" "user" "cart" "catalogue")

# Docker tag suffix
tag_suffix="v1"

# Docker Hub repository
repository_prefix="$username/"

# Iterate over image names and build/push images
for name in "${image_names[@]}"; do
    # Build the Docker image
    docker build -t "$name:$tag_suffix" "$name"

    # Tag the image with the Docker Hub repository
    docker tag "$name:$tag_suffix" "$repository_prefix$name:$tag_suffix"

    # Push the image to Docker Hub
    docker push "$repository_prefix$name:$tag_suffix"

    # Remove the local image to save space (optional)
    docker rmi "$name:$tag_suffix"
    docker rmi "$repository_prefix$name:$tag_suffix"
done
