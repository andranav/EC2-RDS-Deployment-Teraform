#!/usr/bin/env bash

ROOT="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
export APP_LUNCH=${ROOT}/appLunch.sh
printf APP_LUNCH
terraform init
terraform apply -auto-approve

