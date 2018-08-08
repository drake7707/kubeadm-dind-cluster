#!/bin/bash

#print the environment variables needed to be pushed to the client
#don't print anything else as each line is directly put into the environment variables list

set -o errexit
set -o nounset
set -o pipefail
set -o errtrace
set -x

if [ $(uname) = Darwin ]; then
  readlinkf(){ perl -MCwd -e 'print Cwd::abs_path shift' "$1";}
else
  readlinkf(){ readlink -f "$1"; }
fi

if [[ -z "${DIND_ROOT:-}" ]]; then
  DIND_ROOT="$(cd $(dirname "$(readlinkf "${BASH_SOURCE}")"); pwd)"
fi

source ${DIND_ROOT}/config.sh

function push {
  local key=$1
  local value=${2:-}
  if [[ -z ${value} ]]; then
    # read it from the config
    set | grep "^${key}"
  else
    # print it directly
    echo ${key}=${value}
  fi
}

push "REGISTRY" # if a different registry is hosted than the private registry

push "VPN_SUBNET" # worker needs the VPN Subnet in its client config
push "VPN_GATEWAY" # needs to know what the gateway is to access the private repository

push "HOST_PRIVATE_REGISTRY" # worker needs to know if there is a private registry available that it can use

push "CNI_PLUGIN" # worker has to match the CNI 
push "POD_NETWORK_CIDR" # worker has to match the CIDR pod network

push "DIND_SKIP_PULL" # don't try and pull the dind image, it' possible that is is loaded from a tar file

push "DIND_INSECURE_REGISTRIES" # push the insecure registries to the worker

push "REMOTE_DNS64_V4SERVER" # push what DNS should be used

# other things that are static in the config file and the client needs to know
push "DIND_SUBNET" # this doesn't really matter that it's the same as the server, it's the private subnet behind the VPN gateway, but it needs to be filled in

# push which images to use
# don't push VPN image because it can be ARM as well, not just the ARCH of the master
#push "VPN_IMAGE" 

push "KUBE_PROXY_IMAGE_REPOSITORY"
push "FLANNEL_IMAGE_REPOSITORY"
# don't push DIND image, the worker image is set in the fuse script


