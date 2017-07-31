#!/bin/bash

if [[ -e /etc/nginx ]]; then
  echo "Moving /etc/nginx to /etc/nginx-original"
  mv /etc/nginx /etc/nginx-original
fi

cp -r nginx /etc/
