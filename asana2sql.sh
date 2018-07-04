#!/bin/bash
docker run --rm --link bd:mysql asana2sql "$@"
