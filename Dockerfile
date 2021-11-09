FROM quay.io/openshift-release-dev/ocp-v4.0-art-dev@sha256:f899c0680f1f00f03d170a1ec420cb1576216577059dac73d1c7dde65ffcffea

RUN dnf -y install git make sudo gcc \
&& dnf clean all \
&& rm -rf /var/cache/dnf

RUN mkdir -p /root/nvidia
WORKDIR /root/nvidia
ADD NVIDIA-Linux-x86_64-470.63-vgpu-kvm.run .
RUN chmod +x /root/nvidia/NVIDIA-Linux-x86_64-470.63-vgpu-kvm.run
ADD entrypoint.sh .
RUN chmod +x /root/nvidia/entrypoint.sh

RUN mkdir -p /root/tmp
