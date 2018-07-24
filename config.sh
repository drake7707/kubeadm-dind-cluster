if [[ ${IP_MODE} = "ipv4" ]]; then
    # DinD subnet (expected to be /16)
    DIND_SUBNET="${DIND_SUBNET:-10.192.0.0}"
else
    # DinD subnet (expected to be /64)
    DIND_SUBNET="${DIND_SUBNET:-fd00:10::}"
fi

VPN_CONFIG_FILE=${VPN_CONFIG_FILE:-/home/dwight/kube4.ovpn}
VPN_IMAGE=${VPN_IMAGE:-drake7707/openvpn-client}
# TODO this can be inferred from the openvpn container
VPN_SUBNET=192.168.255.0/24

REMOTE_DNS64_V4SERVER=8.8.8.8

# Apiserver port
APISERVER_PORT=${APISERVER_PORT:-8080}
APISERVER_BINDIP=0.0.0.0

# IP that will be used to advertise the API server
MASTER_ADVERTISE_IP=10.10.127.41

# Number of nodes. 0 nodes means just one master node.
# In case of NUM_NODES=0 'node-role.kubernetes.io/master' taint is removed
# from the master node.
#NUM_NODES=${NUM_NODES:-2}
NUM_NODES=1

# Use non-dockerized build
# KUBEADM_DIND_LOCAL=

# Use prebuilt DIND image
#DIND_IMAGE="${DIND_IMAGE:-mirantis/kubeadm-dind-cluster:v1.11}"
DIND_IMAGE="${DIND_IMAGE:-idlabfuse/kubeadm-dind-cluster:v1.11}"
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
CNI_PLUGIN="${CNI_PLUGIN:-bridge}"

# When using Calico with Kubernetes as the datastore (calico-kdd) your
# controller manager needs to be started with `--cluster-cidr=192.168.0.0/16`.
# More information here: http://docs.projectcalico.org/v2.3/getting-started/kubernetes/installation/hosted/kubernetes-datastore/
# POD_NETWORK_CIDR="192.168.0.0/16"

# Set SKIP_SNAPSHOT to non-empty string to skip making the snapshot.
# This may be useful for CI environment where the cluster is never
# restarted after it's created.
# SKIP_SNAPSHOT=y

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
