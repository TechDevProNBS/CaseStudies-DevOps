#!/bin/bash

#JENKINS
ansible-playbook \
    -i "$(terraform output jenkins_fqdn)," \
    -u sam \
    --ssh-common-args="-o StrictHostKeyChecking=no" playbooks/jenkins.yml

# NGINX
ansible-playbook \
    -i "$(terraform output nginx_fqdn)," \
    -u sam \
    --ssh-common-args="-o StrictHostKeyChecking=no" playbooks/nginx.yml
