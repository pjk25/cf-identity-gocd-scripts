#!/usr/bin/bash -ex

CONFIG=`pwd`/integration_config.json
../../cf-acceptance-tests/bin/test -v
