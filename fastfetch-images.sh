#!/bin/zsh

if [ -f .env ]; then
  export $(grep -v '^#' .env | xargs)
fi

base_dir="${BASE_DIR:-~/Pictures/fastfetch}"

logo_width="35"
logo_height="20"

images=($(fd -e jpg -e png -e gif . "$base_dir"))

if [ ${#images[@]} -eq 0 ]; then
  fastfetch
else
  random_image=${images[RANDOM % ${#images[@]}]}
  fastfetch --logo "$random_image" --logo-width "$logo_width" --logo-height "$logo_height"
fi
