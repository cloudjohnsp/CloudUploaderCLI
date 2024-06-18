#!/bin/bash

generate_shareable_link() {
  echo $(aws s3 presign s3://"$BUCKET_NAME"/$(basename "$1") --expires-in 25000)
}

upload_file_to_bucket() {
    local object_name="$1"
    response=$(aws s3 cp $object_name s3://"$BUCKET_NAME")

    if [[ $? -ne 0 ]]; then
      echo "Error while uploading file(s)"
      echo "Error: $response"
    else
      echo "File uploaded successfully to S3 bucket!"
      echo -n "Do you want to generate a shareable link?(y/n): "
      read generate_answer
      if [[ "$generate_answer" == "y" ]] || [[ "$generate_answer" == "Y" ]]; then
        generate_shareable_link $object_name
      fi
    fi
}


for file_path in "$@"; do
  if [[ ! -f "$file_path" ]]; then
    echo "File: "$file_path" does not exist or is a directory."
  else
    upload_file_to_bucket "$file_path"
  fi
done