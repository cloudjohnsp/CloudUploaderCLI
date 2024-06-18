#!/bin/bash

upload_file_to_bucket() {
    response=$(aws s3 cp "$1" s3://"$BUCKET_NAME")
    echo $response
    if [[ $? -ne 0 ]]; then
      echo "Error while uploading file(s)"
      echo "Error: $response"
    else
      echo "File uploaded successfully to S3 bucket!"
    fi
}

for file_path in "$@"; do
  if [[ ! -f "$file_path" ]]; then
    echo "File: "$file_path" does not exist or is a directory."
  else
    upload_file_to_bucket "$file_path"
  fi
done | pv