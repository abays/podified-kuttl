#!/bin/bash

set -ex

# Where are our CRDs and sample CRs?
MARIADB=https://github.com/openstack-k8s-operators/mariadb-operator.git
KEYSTONE=https://github.com/openstack-k8s-operators/keystone-operator.git

# Make dirs for holding CRDs and sample CRs
mkdir -p /tmp/crds
mkdir -p /tmp/crs/mariadb
mkdir -p /tmp/crs/keystone

# Clone the operators
rm -rf /tmp/mariadb-operator || true
rm -rf /tmp/keystone-operator || true
git clone ${MARIADB} /tmp/mariadb-operator
git clone ${KEYSTONE} /tmp/keystone-operator

# Copy CRDs for use with KUTTL
cp -f /tmp/mariadb-operator/config/crd/bases/* /tmp/crds/.
cp -f /tmp/keystone-operator/config/crd/bases/* /tmp/crds/.

# Copy example CRs for use with KUTTL
cp -f /tmp/mariadb-operator/config/samples/* /tmp/crs/mariadb/.
cp -f /tmp/keystone-operator/config/samples/* /tmp/crs/keystone/.
