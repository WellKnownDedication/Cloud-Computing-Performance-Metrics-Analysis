#!/bin/bash

# Set variables
DATASET="abdurraziq01/cloud-computing-performance-metrics"
DEST_DIR="data"
ZIP_FILE="$DEST_DIR/cloud-computing-performance-metrics.zip"

# Ensure the data folder exists
mkdir -p "$DEST_DIR"

echo "Looking for dataset..."
# Download dataset if it does not exist
if [ ! -d "$DEST_DIR" ] || [ -z "$(ls -A $DEST_DIR)" ]; then
    echo "Dataset not found. Downloading..."

    curl -L -o "$ZIP_FILE" \
      "https://www.kaggle.com/api/v1/datasets/download/$DATASET"

    # Unzip the dataset
    unzip -o "$ZIP_FILE" -d "$DEST_DIR"
    rm "$ZIP_FILE"  # Remove zip after extracting
    echo "Dataset downloaded and extracted to $DEST_DIR."
else
    echo "Dataset already exists at $DEST_DIR."
fi


