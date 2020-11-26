# SSH server in docker




## Preparations

* Generate client keys in app_client, update etc_server/ssh/authorized_keys/test accordingly
* Generate certificate (CA) and the key for the server (ssh_host_ed25519_key)


    cd app_server/ca
    ssh-keygen -t ed25519 -f CA
    cd app_server/.ssh
    ssh-keygen -t ed25519 -f ssh_host_ed25519_key

* sign the key 


    cd app_server/.ssh
    ssh-keygen -h -s ../ca/CA -n serv -I ID -V +1500d ssh_host_ed25519_key.pub

* update the signature of the server on a client in `etc_client/ssh/ssh_known_hosts`

* build and run 


    docker-compose up --build
    
* now you can ssh to a client and connect to the server:

    
    docker exec -it sshserver_clie_1 bash
    ssh test@serv -i ./client -vvv
    
  you should not get the message new untrusted fingerprint.
    

## Used materials

* https://docs.docker.com/compose/compose-file/
* https://vsupalov.com/docker-shared-permissions/
* https://vsupalov.com/docker-shared-permissions/
* https://en.wikibooks.org/wiki/OpenSSH/Client_Configuration_Files
