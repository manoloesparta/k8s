#!/bin/bash

set -xe

mkdir -p controller 

cat ca-csr-template.json \
  | sed s'/CN_PLACEHOLDER/system:kube-controller-manager/'g \
  | sed s'/COMPONENT_PLACEHOLDER/system:masters/g' > controller/ca-csr.json

cfssl gencert -ca=rootca/ca.pem -ca-key=rootca/ca-key.pem -config=ca-config.json -profile=kubernetes controller/ca-csr.json | cfssljson -bare kube-controller-manager

mv kube-controller-manager-key.pem kube-controller-manager.csr kube-controller-manager.pem controller
