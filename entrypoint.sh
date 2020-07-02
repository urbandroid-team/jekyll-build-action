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

ll
which lftp
jekyll build --trace --config _config.yml,deploy.yml
#sudo chown -R $USER:$USER /home/runner/work/sleep-docs
lftp -e 'mirror -R --parallel=20  _site/. /; bye' -u $FTP_USER,$FTP_PASS $FTP_SERVER


####################################################
# Build completed
####################################################

echo "Completed Jekyll build"
