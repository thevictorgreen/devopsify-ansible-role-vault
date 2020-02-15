#!/bin/bash


# LOG OUTPUT TO A FILE
exec 3>&1 4>&2
trap 'exec 2>&4 1>&3' 0 1 2 3
exec 1>/root/.vault_automate/log.out 2>&1


if [[ ! -f "/root/.vault_automate/init.cfg" ]]
then
  # GENERATE SELF SIGNED CERTIFICATES FOR NGINX REVERSE PROXY
  openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/nginx/vault.key -out /etc/nginx/vault.crt -config /etc/nginx/req.conf
  # GENERATE STRONG DIFFIEHELMAN PARAMS
  openssl dhparam -out /etc/ssl/certs/dhparam.pem 2048
  # RESTART NGINX
  systemctl restart nginx
  # CHECK NGINX STATUS
  systemctl status nginx
  # MARK THIS CODE BLOCK AS INITIALIZED
  touch /root/.vault_automate/init.cfg
fi
