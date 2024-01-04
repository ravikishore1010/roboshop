#!/bin/bash

# List of image names
image_names=("web" "mongodb" "mysql" "payment" "ratings" "redis" "shipping" "user" "cart" "catalogue")

# Docker tag suffix
tag_suffix="v1"

# Iterate over image names and build images with the "v1" tag
for name in "${image_names[@]}"; do
    echo "Building and tagging image: $name:$tag_suffix"
    (cd "$name" && docker build -t "$name:$tag_suffix" .)
done