#!/bin/bash

cat >"$HOME/extra_env.yaml"<<EOF
---
parameter_defaults:
    Debug: true
EOF

openstack overcloud deploy --debug \
--templates \
--environment-file "$HOME/extra_env.yaml" \
--libvirt-type kvm \
--ntp-server 10.87.28.253 \
-e network-environment.yaml \
--log-file overcloud_install.log &> overcloud_install.log
