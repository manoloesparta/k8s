#!/bin/bash

set -xe

mkdir -p admin

cat ca-csr-template.json \
  | sed s'/CN_PLACEHOLDER/admin/'g \
  | sed s'/COMPONENT_PLACEHOLDER/system:masters/g' > admin/ca-csr.json

cfssl gencert -ca=rootca/ca.pem -ca-key=rootca/ca-key.pem -config=ca-config.json -profile=kubernetes admin/ca-csr.json | cfssljson -bare admin

mv admin-key.pem admin.csr admin.pem admin
