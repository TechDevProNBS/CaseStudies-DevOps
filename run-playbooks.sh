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

#DOCKER
ansible-playbook \
    -i "$(terraform output nginx_fqdn), $(terraform output jenkins_fqdn), $(terraform output mysql_fqdn), $(terraform output eureka_fqdn), $(terraform output node_fqdn), $(terraform output springboot_fqdn), $(terraform output zuul_fqdn)," \
    -u sam \
    --ssh-common-args="-o StrictHostKeyChecking=no" playbooks/docker.yml
