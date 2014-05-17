#!/usr/bin/env bash

set -ue

ANSIBLE_VERSION=1.6.1

usage_exit () {
  echo "Usage: $0" >&2
  exit 1
}

command -v virtualenv > /dev/null || pip install virtualenv
[[ -d vendor ]] || virtualenv vendor
[[ -x vendor/bin/ansible ]] || {
  ./vendor/bin/pip install ansible==$ANSIBLE_VERSION
}
[[ $(./vendor/bin/pip list -l | awk '($1 == "ansible") { print $2 }') == "($ANSIBLE_VERSION)" ]] || {
  ./vendor/bin/pip install ansible==$ANSIBLE_VERSION
}

