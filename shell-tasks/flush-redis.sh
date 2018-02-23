#!/bin/bash

echo '########################################';
echo 'FLUSH REDIS CACHE';
echo '########################################';

# Pull from Origin
if ! [ -x "$(command -v redis-cli)" ]; then
    echo '- Error: redis-cli is not installed.';
else
    echo '- Cache flushing : ';
    redis-cli flushall;
fi
