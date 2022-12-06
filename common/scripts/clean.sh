#!/bin/bash

SERVICE_CRDS=()

#
# Clean the field to help avoid false positives and negatives
#

# Try deleting any OpenStackControlPlanes first
oc delete osctlplane -n openstack --all

# Now delete individual service operators, minus Keystone
for i in "${SERVICE_CRDS[@]}"
do
    oc delete ${i} -n openstack --all
done

sleep 3

# Now delete Keystone
oc delete keystoneapi -n openstack --all

sleep 3

# Finally delete MariaDB
oc delete mariadb -n openstack --all

#
# ...also clear events for good measure :)
#
oc delete events --all -n openstack
