#!/bin/bash -ex

bosh login admin admin
bosh deployment the_manifest.yml
bosh run errand cf_acceptance_tests_errand