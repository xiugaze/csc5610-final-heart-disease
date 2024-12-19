#!/bin/bash

download() {
    URL=$1
    OUTDIR=$2

    mkdir -p "$OUTDIR"

    ZIP_FILE="./$(basename "$URL").zip"

    curl -L -o "$ZIP_FILE" "$URL"
    unzip -o "$ZIP_FILE" -d "$OUTDIR"
    rm "$ZIP_FILE"
}

download "https://www.kaggle.com/api/v1/datasets/download/andrewmvd/heart-failure-clinical-data" "./data/Heart_Failure_Prediction"
download "https://www.kaggle.com/api/v1/datasets/download/rishidamarla/heart-disease-prediction" "./data/Heart_Disease_Prediction"
download "https://www.kaggle.com/api/v1/datasets/download/kamilpytlak/personal-key-indicators-of-heart-disease" "./data/Heart_Disease_Dataset"
