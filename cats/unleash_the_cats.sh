#!/bin/bash -ex

bosh login admin admin
bosh deployment the_manifest.yml
bosh run errand smoke_tests
