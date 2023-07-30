#!/bin/bash

set -xe

mkdir -p rootca

cat ca-csr-template.json \
  | sed s'/CN_PLACEHOLDER/Kubernetes/'g \
  | sed s'/COMPONENT_PLACEHOLDER/Kubernetes/g' > rootca/ca-csr.json

cfssl gencert -initca rootca/ca-csr.json | cfssljson -bare ca

mv ca-key.pem ca.csr ca.pem rootca
