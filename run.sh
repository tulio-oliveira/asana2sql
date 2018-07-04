#!/bin/bash
docker run -it --rm --link bd:mysql -v "$PWD":/app -w /app asana2sql "$@"
