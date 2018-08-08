# Version 1.8.15
#KUBEADM_URL_1_8='https://storage.googleapis.com/kubernetes-release/release/v1.8.15/bin/linux/amd64/kubeadm'
#KUBEADM_SHA1_1_8=e27d026050265f4fe9fa55128598bfc06e0cb1fc
#HYPERKUBE_URL_1_8='https://storage.googleapis.com/kubernetes-release/release/v1.8.15/bin/linux/amd64/hyperkube'
#HYPERKUBE_SHA1_1_8=f8ffface42711337e717532cca2f46146970ad8c
#KUBECTL_URL_1_8='https://storage.googleapis.com/kubernetes-release/release/v1.8.15/bin/linux/amd64/kubectl'
#KUBECTL_SHA1_1_8=52a1ee321e1e8c0ecfd6e83c38bf972c2c60adf2
#KUBECTL_DARWIN_URL_1_8='https://storage.googleapis.com/kubernetes-release/release/v1.8.15/bin/darwin/amd64/kubectl'
#KUBECTL_DARWIN_SHA1_1_8=ac3f823d7aa104237929a1e35ea400c6aa3cc356

# Version 1.9.9
#KUBEADM_URL_1_9='https://storage.googleapis.com/kubernetes-release/release/v1.9.9/bin/linux/amd64/kubeadm'
#KUBEADM_SHA1_1_9=d6402473ac3ba5a7bceb929cc712d08f71c714b0
#HYPERKUBE_URL_1_9='https://storage.googleapis.com/kubernetes-release/release/v1.9.9/bin/linux/amd64/hyperkube'
#HYPERKUBE_SHA1_1_9=21814b1d130b113f937180bd12a02fa45e5f0437
#KUBECTL_URL_1_9='https://storage.googleapis.com/kubernetes-release/release/v1.9.9/bin/linux/amd64/kubectl'
#KUBECTL_SHA1_1_9=c8163a6360119c56d163fbd8cef8727e9841e712
#KUBECTL_DARWIN_URL_1_9='https://storage.googleapis.com/kubernetes-release/release/v1.9.9/bin/darwin/amd64/kubectl'
#KUBECTL_DARWIN_SHA1_1_9=09585552eb7616954481789489ec382c633a0162

# Version 1.10.5
#KUBEADM_URL_1_10='https://storage.googleapis.com/kubernetes-release/release/v1.10.5/bin/linux/amd64/kubeadm'
#KUBEADM_SHA1_1_10=c18b917bca94088e95bdad1849f176f7e3c6f05b
#HYPERKUBE_URL_1_10='https://storage.googleapis.com/kubernetes-release/release/v1.10.5/bin/linux/amd64/hyperkube'
#HYPERKUBE_SHA1_1_10=3330fa08031a4c558f1916f62919af4c1bbea906
#KUBECTL_URL_1_10='https://storage.googleapis.com/kubernetes-release/release/v1.10.5/bin/linux/amd64/kubectl'
#KUBECTL_SHA1_1_10=dbe431b2684f8ff4188335b3b3cea185d5a9ec44
#KUBECTL_DARWIN_URL_1_10='https://storage.googleapis.com/kubernetes-release/release/v1.10.5/bin/darwin/amd64/kubectl'
#KUBECTL_DARWIN_SHA1_1_10=08e58440949c71053b45bfadf80532ea3d752d12

# Version 1.11.0

if [[ ${ARCH} == "arm" ]]; then
    KUBEADM_URL_1_11='https://storage.googleapis.com/kubernetes-release/release/v1.11.0/bin/linux/arm/kubeadm'
    KUBEADM_SHA1_1_11=d498eb5f6d1304b837be9d37406ee612c9005680
    HYPERKUBE_URL_1_11='https://storage.googleapis.com/kubernetes-release/release/v1.11.0/bin/linux/arm/hyperkube'
    HYPERKUBE_SHA1_1_11=42c85bd4e2a9aafb83f84bdb48a49aed5056e3ec
    KUBECTL_URL_1_11='https://storage.googleapis.com/kubernetes-release/release/v1.11.0/bin/linux/arm/kubectl'
    KUBECTL_SHA1_1_11=c979e7402256630982dab8de677c5a4993121784
    KUBECTL_DARWIN_URL_1_11=
    KUBECTL_DARWIN_SHA1_1_11=

    KUBELET_URL_1_11='https://storage.googleapis.com/kubernetes-release/release/v1.11.0/bin/linux/arm/kubelet'
    KUBELET_SHA1_1_11=1b63a8adf2dfb803914343a2603d719297164687
else 
    KUBEADM_URL_1_11='https://storage.googleapis.com/kubernetes-release/release/v1.11.0/bin/linux/amd64/kubeadm'
    KUBEADM_SHA1_1_11=67ccf0cf545ffc935e0e52db4a9b303f55dcf1cc
    HYPERKUBE_URL_1_11='https://storage.googleapis.com/kubernetes-release/release/v1.11.0/bin/linux/amd64/hyperkube'
    HYPERKUBE_SHA1_1_11=6ab65a3795e9c95ad1f78c79302e944655e7cdf5
    KUBECTL_URL_1_11='https://storage.googleapis.com/kubernetes-release/release/v1.11.0/bin/linux/amd64/kubectl'
    KUBECTL_SHA1_1_11=e23f251ca0cb848802f3cb0f69a4ba297d07bfc6
    KUBECTL_DARWIN_URL_1_11='https://storage.googleapis.com/kubernetes-release/release/v1.11.0/bin/darwin/amd64/kubectl'
    KUBECTL_DARWIN_SHA1_1_11=6eff29a328c4bc00879fd6a0c8b33690c6f75908

    KUBELET_URL_1_11='https://storage.googleapis.com/kubernetes-release/release/v1.11.0/bin/linux/amd64/kubelet'
    KUBELET_SHA1_1_11=9e0f3fb99a05bc952b48eba6b5ced2174239883e
fi

# url and sha1sum of hyperkube binary -- only used for prebuilt hyperkube
#KUBEADM_URL=${KUBEADM_URL:-${KUBEADM_URL_1_11}}
#KUBEADM_SHA1=${KUBEADM_SHA1:-${KUBEADM_SHA1_1_11}}
#HYPERKUBE_URL=${HYPERKUBE_URL:-${HYPERKUBE_URL_1_11}}
#HYPERKUBE_SHA1=${HYPERKUBE_SHA1:-${HYPERKUBE_SHA1_1_11}}
