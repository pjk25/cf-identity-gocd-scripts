#!/usr/bin/env bash

set -ex

./update
cp `dirname "$0"`/cf-stub.yml .
rm -f ~/.bosh_config
bosh -u admin -p admin target $BOSH_LITE_TARGET
../gocd_scripts/replace_director_uuid.sh
../gocd_scripts/generate_warden_manifest.sh
bosh -n create release cf --force
bosh login admin admin
bosh -n upload release --skip-if-exists
bosh -n upload stemcell http://bosh-jenkins-gems-warden.s3.amazonaws.com/stemcells/latest-bosh-stemcell-warden.tgz --skip-if-exists
bosh deployment the_manifest.yml
bosh -n deploy
