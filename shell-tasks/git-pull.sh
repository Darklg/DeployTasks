#!/bin/bash

cd "${DEPLOYTASKS__PROJECT_DIR}";

echo '########################################';
echo 'PULL';
echo '########################################';

# Pull from Origin
git pull;

echo '########################################';
echo 'UPDATE SUBMODULES';
echo '########################################';

# Update submodules
git submodule update --init --recursive;
