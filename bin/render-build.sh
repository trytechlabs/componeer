#!/usr/bin/env bash
# exit on error
set -o errexit

echo 'Current directory: ' $PWD
echo 'Environment: ' $RAILS_ENV
echo 'Ruby version: ' $(ruby -v)
echo 'Bundler version: ' $(bundle -v)
echo 'Node version: ' $(node -v)
echo 'Yarn version: ' $(yarn -v)
echo '-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-'
echo 'Project files tree:'
ls -la
echo '-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-'
echo 'Installing dependencies'
echo 'Copying credentials...'

cp /etc/secrets/master.key ./config/credentials/master.key

bundle config set --local deployment 'false'
bundle install
./bin/rails assets:precompile
./bin/rails assets:clean
