#!/bin/bash
# DO NOT EDIT THIS FILE
# This file is controlled by Drainpipe, run composer install to apply pending
# updates.

set -eux
echo "Updating..."

composer install
./vendor/bin/task sync

# Set file permissions such that Drupal will not complain.
chgrp -R www-data "${DOCROOT}/sites/default/files"
find "${DOCROOT}/sites/default/files" -type d -exec chmod 2775 {} \;
find "${DOCROOT}/sites/default/files" -type f -exec chmod 0664 {} \;
