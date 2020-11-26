#!/bin/sh
set -x
set -e

echo "defining server name"
server_name="serv"

echo "defining client name"
client_name="clie"

echo "defining server keys comment (it will be added at the end of public keys)"
server_key_comment="server@serv"

echo "-------------------------------------------------------------"
echo "setting up the server"

echo "generating certificate authority"
ssh-keygen -t ed25519 -f keys_server/ca/CA -q -N "" -C "$server_key_comment"

echo "generating server key"
ssh-keygen -t ed25519 -f keys_server/.ssh/ssh_host_ed25519_key -q -N "" -C "$server_key_comment"

echo "signing the server key with certificate"
ssh-keygen -h -s keys_server/ca/CA -n "$server_name" -I ID -V +1500d keys_server/.ssh/ssh_host_ed25519_key.pub


echo "copy the signed server keys to the configuration directory of server's sshd"
cp keys_server/.ssh/ssh_host_ed25519_key keys_server/.ssh/ssh_host_ed25519_key.pub keys_server/.ssh/ssh_host_ed25519_key-cert.pub etc_server/ssh/


echo "-------------------------------------------------------------"
echo "setting up the client"
echo "set up ssh_known_hosts for the client. First we write the prefix and then we append the content of the public certificate"
echo -n "@cert-authority $server_name " > etc_client/ssh/ssh_known_hosts
cat keys_server/ca/CA.pub >> etc_client/ssh/ssh_known_hosts


echo "generating the keys for the client"
ssh-keygen -t ed25519 -f app_client/client -q -N "" -C "$client_name"


echo "add client's public key to the servers authorized keys"
cp app_client/client.pub etc_server/ssh/authorized_keys/test


echo "done"
