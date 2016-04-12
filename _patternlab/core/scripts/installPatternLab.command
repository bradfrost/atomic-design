#!/bin/sh
DIR="$( cd "$( dirname "$0" )" && pwd )"
cd "$DIR/../../"
php "core/bin/composer.phar" install
php "core/console" -g