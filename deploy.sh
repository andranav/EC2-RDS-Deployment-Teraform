#!/usr/bin/env bash

: ${SSH_PUBLIC_KEY:?"Need to specify path of a public key(e.g. export SSH_PUBLIC_KEY=\"~/.ssh/id_rsa.pub\")"}

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
cd ${DIR}/terraform

terraform init
terraform apply -auto-approve \
-var "public_key_path=${SSH_PUBLIC_KEY}"

echo -e "The application has been deployed successfully.
Access by below links in a few seconds.
---------App Info---------
URL: http://$(terraform output elb_endpoint):5000
Create user: http://$(terraform output elb_endpoint):5000?user=TestUser&email=testuser@gmail.com
"