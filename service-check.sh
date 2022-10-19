#i/bin/bash
#Script written by Martyn 19/10/2022
#Purpose of script = check status of ssh, firewalld, docker statuses. Create log.

services=(sshd firewalld docker)
for i in "${services[@]}"
do
  if systemctl is-active --quiet $i && msg="$i service is running" ; then
    systemctl is-enabled --quiet $i && msg="${msg} and is enabled"
  else msg="$i service is stopped"
  fi
  echo $msg | tee -a service-checklog
done
