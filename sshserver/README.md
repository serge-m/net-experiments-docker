# SSH server in docker

## Preparations

In order to make client connect to the server without asking for trusting the fingerprint one can use 
self-signed certificates. The procedure consists of 
* generating certificate keys
* generating server keys
* signing the server keys with the certificate
* configuring the sshd on server side
* adding the public certificate to the client's known_hosts
* generating key pair for the client
* adding the public key of the client to the server's authorized keys

The code is listed in [generate_keys.sh](generate_keys.sh).

## Running

* build and run 


      docker-compose up --build
    
* now you can ssh to a client and connect to the server:

    
      docker exec -it sshserver_clie_1 bash
      ssh test@serv -i ./client -vvv
    
  you should get access to user `test` on the server without a message about new untrusted fingerprint.
    

## Used materials

* https://docs.docker.com/compose/compose-file/
* https://vsupalov.com/docker-shared-permissions/
* https://vsupalov.com/docker-shared-permissions/
* https://en.wikibooks.org/wiki/OpenSSH/Client_Configuration_Files
* https://berndbausch.medium.com/ssh-certificates-a45bdcdfac39
* https://ibug.io/blog/2020/04/ssh-8.2-rsa-ca/
* https://www.cyberciti.biz/tips/linux-unix-bsd-openssh-server-best-practices.html
* https://medium.com/risan/upgrade-your-ssh-key-to-ed25519-c6e8d60d3c54
* https://serge-m.github.io/ssh-cheatsheet.html
