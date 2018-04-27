#!/bin/sh
set -ex
echo $@
if [ $(id -u) = 0 ]; then
  chown -R privacyidea /data
  sudo -u privacyidea $0 $@
  exit 0
fi

PATH=$HOME/.local/bin:$PATH

init() {
  mkdir -p /data/keys
  pi-manage createdb
  pi-manage create_enckey
  pi-manage create_audit_keys
}

case $1 in
  init)
    init
  ;;
  *)
    pi-manage $@
  ;;
esac
