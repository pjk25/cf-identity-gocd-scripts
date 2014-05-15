#!/bin/bash -ex

CONFIG=`dirname "$0"`/integration_config.json
./bin/test -v
