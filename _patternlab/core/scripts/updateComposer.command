#!/bin/sh
DIR="$( cd "$( dirname "$0" )" && pwd )"
cd "$DIR/../../"
php "core/bin/composer.phar" self-update