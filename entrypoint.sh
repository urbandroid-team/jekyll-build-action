#!/bin/sh

set -x # verbose mode
set -e # stop executing after error

echo "Starting Jekyll build"

####################################################
# Set workspace permissions
####################################################

chmod -R a+w /github/workspace

####################################################
# Build the Jekyll site
####################################################

sudo jekyll build --trace --config _config.yml,deploy.yml

####################################################
# Build completed
####################################################

echo "Completed Jekyll build"
