#!/bin/bash

FOLDER=$1
NUM_FILES=20
EXTENSIONS=("txt" "py" "json" "html" "css" "md" "log")

# Create folder
mkdir -p "$FOLDER"

# Function to generate random name
random_name() {
  tr -dc 'a-zA-Z0-9' </dev/urandom | head -c 4
}

# Create files
for (( i=1; i<=NUM_FILES; i++ ))
do
  NAME=$(random_name)
  EXT=${EXTENSIONS[$RANDOM % ${#EXTENSIONS[@]}]}
  touch "$FOLDER/$NAME.$EXT"
done

echo "✨ $NUM_FILES random files created in '$FOLDER' ✨"

