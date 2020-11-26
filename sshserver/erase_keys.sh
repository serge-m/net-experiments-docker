#!/bin/bash
set -x


(cd keys_server/ca/ && rm CA CA.pub)
(cd keys_server/.ssh/ && rm ssh_host_ed25519_key ssh_host_ed25519_key.pub ssh_host_ed25519_key-cert.pub)
(cd etc_server/ssh/ && rm ssh_host_ed25519_key ssh_host_ed25519_key.pub ssh_host_ed25519_key-cert.pub)

rm etc_client/ssh/ssh_known_hosts

(cd app_client && rm client client.pub)

rm etc_server/ssh/authorized_keys/test

echo "done"
