#!/bin/bash

FOLDER="generated_files"
NUM_FILES=20
EXTENSIONS=("txt" "py" "json" "html" "css" "md" "log")

# Create folder
mkdir -p "$FOLDER"

# Function to generate random name
random_name() {
  tr -dc 'a-z0-9' </dev/urandom | head -c 8
}

# Create files
for (( i=1; i<=NUM_FILES; i++ ))
do
  NAME=$(random_name)
  EXT=${EXTENSIONS[$RANDOM % ${#EXTENSIONS[@]}]}
  touch "$FOLDER/$NAME.$EXT"
done

echo "✨ $NUM_FILES random files created in '$FOLDER' ✨"

