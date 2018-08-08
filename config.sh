# Image repository for kube adm to pull images such as control plane from
# Can be omitted when the private registry is hosted, then it will be pull from there
KUBE_IMAGE_REPOSITORY=${REGISTRY:-k8s.gcr.io}
DASHBOARD_IMAGE_REPOSITORY=${REGISTRY:-gcr.io}
KUBE_PROXY_IMAGE_REPOSITORY=${REGISTRY:-gcr.io}
FLANNEL_IMAGE_REPOSITORY=${REGISTRY:-quay.io}

REGISTRY=${REGISTRY:-docker.io}
IMAGE_PREFIX=${REGISTRY}/

##############################
#         VPN config         #
##############################

# vpn config for both
VPN_SUBNET=${VPN_SUBNET:-192.168.254.0/24}
VPN_GATEWAY=${VPN_GATEWAY:-192.168.254.1}

# vpn config for master
HOST_VPN_SERVER=y
VPN_SERVER_IMAGE=${VPN_SERVER_IMAGE:-${IMAGE_PREFIX}idlabfuse/openvpn-server-${ARCH}}
VPN_KEYSIZE=512
VPN_PUBLIC_IP=${VPN_PUBLIC_IP:-}
VPN_PUBLIC_PORT=${VPN_PUBLIC_PORT:-443}

VPN_IMAGE=${VPN_IMAGE:-${IMAGE_PREFIX}idlabfuse/openvpn-client-${ARCH}}

# set the vpn config file to use for the vpn client. Can be left blank for the master if it hosts a VPN server
VPN_CONFIG_FILE=${VPN_CONFIG_FILE:-}

##############################
#         API Server         #
##############################

# also run the api server container so workers can join based on the token alone
HOST_API_SERVER=y
API_SERVER_IMAGE=${API_SERVER_IMAGE:-${IMAGE_PREFIX}idlabfuse/fuse-api-server-${ARCH}}
# The api server hosts a https endpoint and if the certificate & private key is left empty it will use the crt & key generated for the openvpn server
API_CRT_FILE=
API_KEY_FILE=

##############################
#     Private registry       #
##############################

# also host the private registry
HOST_PRIVATE_REGISTRY=${HOST_PRIVATE_REGISTRY:-y}
PRIVATE_REGISTRY_IMAGE=registry:2
PRIVATE_REGISTRY_TAR_DIR="$(pwd)/images"
#PRIVATE_REGISTRY_TAR_DIR=/home/dwight/fuse/output/fuse-master/images
PRIVATE_REGISTRY_TAR_FILE=fuse_repository.tar


##############################
#         DinD config        #
##############################

# The image repository is insecure, so make sure to add it to the /etc/docker/daemon.json
DIND_INSECURE_REGISTRIES="[ \"${REGISTRY}\", \"${VPN_GATEWAY}:5000\" ]"

if [[ ${IP_MODE:-ipv4} = "ipv4" ]]; then
    # DinD subnet (expected to be /16)
    DIND_SUBNET="${DIND_SUBNET:-10.192.0.0}"
else
    # DinD subnet (expected to be /64)
    DIND_SUBNET="${DIND_SUBNET:-fd00:10::}"
fi

REMOTE_DNS64_V4SERVER=8.8.8.8

# Apiserver port
APISERVER_PORT=${APISERVER_PORT:-8080}
APISERVER_BINDIP=0.0.0.0

# Number of nodes. 0 nodes means just one master node.
# In case of NUM_NODES=0 'node-role.kubernetes.io/master' taint is removed
# from the master node.
#NUM_NODES=${NUM_NODES:-2}
# This must be on 0, local worker nodes are not supported because they would need to share the VPN
NUM_NODES=0

# Make sure that each worker that joins the cluster gets assigned an unique number
WORKER_NODE_ID=${WORKER_NODE_ID:-0}

# Use non-dockerized build
# KUBEADM_DIND_LOCAL=

# Use prebuilt DIND image
DIND_IMAGE="${DIND_IMAGE:-${IMAGE_PREFIX}idlabfuse/kubeadm-dind-cluster-${ARCH}:v1.11}"
#DIND_IMAGE="${DIND_IMAGE:-idlabfuse/kubeadm-dind-cluster-worker-${ARCH}:v1.11}"
DIND_SKIP_PULL=y

# Set to non-empty string to enable building kubeadm
# BUILD_KUBEADM=y

# Set to non-empty string to enable building hyperkube
# BUILD_HYPERKUBE=y

# download kubectl on the host
# Set automatically based on DIND image version tag
# if image version tag is of the form vNNN.NNN
# LOCAL_KUBECTL_VERSION="${LOCAL_KUBECTL_VERSION:-v1.10}"

# Set custom URL for Dashboard yaml file
# DASHBOARD_URL="${DASHBOARD_URL:-https://rawgit.com/kubernetes/dashboard/bfab10151f012d1acc5dfb1979f3172e2400aa3c/src/deploy/kubernetes-dashboard.yaml}"

# CNI plugin to use (bridge, flannel, calico, calico-kdd, weave). Defaults to 'bridge'
# In case of 'bridge' plugin, additional hacks are employed to bridge
# DIND containers together.
CNI_PLUGIN="${CNI_PLUGIN:-flannel}"

# When using Calico with Kubernetes as the datastore (calico-kdd) your
# controller manager needs to be started with `--cluster-cidr=192.168.0.0/16`.
# More information here: http://docs.projectcalico.org/v2.3/getting-started/kubernetes/installation/hosted/kubernetes-datastore/
# POD_NETWORK_CIDR="192.168.0.0/16"

# flannel needs 10.244 range
POD_NETWORK_CIDR="10.244.0.0/16"

# Set SKIP_SNAPSHOT to non-empty string to skip making the snapshot.
# This may be useful for CI environment where the cluster is never
# restarted after it's created.
SKIP_SNAPSHOT=y

# Disable parallel running of e2e tests. Use this if you use a resource
# constrained machine for e2e tests and get some flakes.
# DIND_NO_PARALLEL_E2E=y

# Any options to be passed to the docker run both on init and reup.
# By default it's empty
# MASTER_EXTRA_OPTS="  "

# Define which DNS service to run
# possible values are kube-dns (default) and coredns
#DNS_SERVICE="${DNS_SERVICE:-kube-dns}"
DNS_SERVICE=kube-dns

# Feature Gates
# This value will be passed to kube-apiserver, kube-controller-manager and kube-scheduler
# you can set special value 'none' not to set any feature gates on them.
# FEATURE_GATES=""

# Kubelet Feature Gates
# you can set special value 'none' not to set any feature gates on kubelet.
# KUBELET_FEATURE_GATES=""

# You can configure extra component args for kube-apiservers
# APISERVER_underscored_option_name will be converted --hyphenated-option-name
# e.g. APISERVER_admission_control=xxx,yyy -> --admission-control=xxx,yyy
# APISERVER_xxx_yyy=zzz

# Extra component args for kube-controller-manager
# CONTROLLER_MANAGER_underscored_option_name will be converted --hyphenated-option-name
# CONTROLLER_MANAGER_xxx=yyy

# Extra component args for kube-scheduler
# SCHEDULER_underscored_option_name will be converted --hyphenated-option-name
# SCHEDULER_xxx=yyy
