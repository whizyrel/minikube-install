#!/bin/bash

set -e

readarray -td "=", PASS <<<"$1"; declare PASS;
PASSWORD=${PASS[1]}

if [ "$1" == '' ]
then
  echo 'No Root Password provided';
  exit 127
fi

DWN=$(ls -la | grep -c minikube)

# if [[ $DWN == "0" ]]; then
#   echo "Downloading Minikube"
#   curl -Lo minikube https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64
# else
#   echo "Minikube already downloaded"
# fi

set -evx| echo $PASSWORD | sudo -S install minikube-linux-amd64 /usr/local/bin/minikube


echo $(minikube version)
# Kind returns bash: /usr/local/bin/kind: cannot execute binary file: Exec format error
# curl -Lo ./kind https://kind.sigs.k8s.io/dl/v0.12.0/kind-darwin-amd64
# sudo install kind /usr/local/bin/kind
