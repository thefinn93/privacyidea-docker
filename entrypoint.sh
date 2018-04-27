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
  pi-manage createdb
  if [ ! -f /data/encfile ]; then
    pi-manage create_enckey
  fi
  if [ ! -d /data/keys ]; then
    mkdir /data/keys
  fi
  if [ ! -f /data/keys/private.pem ]; then
    pi-manage create_audit_keys
  fi
}

case $1 in
  init)
    init
  ;;
  *)
    pi-manage $@
  ;;
esac
