#!/usr/bin/env bash
# exit on error
set -o errexit

echo 'Current directory: ' $PWD
echo 'Installing dependencies'
echo 'Copying credentials...'

cp /etc/secrets/master.key ./config/credentials/master.key

bundle install
./bin/rails assets:precompile
./bin/rails assets:clean
