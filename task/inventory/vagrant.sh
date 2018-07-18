#!/bin/bash
function vagrant_host() {
  webappBox=$(vagrant ssh-config default)
  echo { "vagrant": { "hosts": [ "default" ], "vars": { } }, "_meta": { "hostvars": { "default": { "ansible_host": "$(echo "$webappBox" | grep HostName | awk -F ' ' '{print $2}')", "ansible_ssh_port": "$(echo "$webappBox" | grep Port | awk -F ' ' '{print $2}')", "ansible_ssh_private_key_file": "$(echo "$webappBox" | grep IdentityFile | awk -F ' ' '{print $2}')", "ansible_ssh_user": "$(echo "$webappBox" | grep "User " | awk -F ' ' '{print $2}')" } } } }
}

if [ "$1" == "--list" ] ; then
        vagrant_host
elif [ "$1" == "--host" ]; then
        echo '{"_meta": {"hostvars": {}}}'
else
        echo "{ }"
fi
