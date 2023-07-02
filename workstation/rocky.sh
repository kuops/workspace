
dnf -y update
dnf -y install epel-release
dnf -y install kernel-devel-$(uname -r) kernel-headers-$(uname -r) dkms
dnf config-manager --add-repo http://developer.download.nvidia.com/compute/cuda/repos/rhel9/x86_64/cuda-rhel9.repo
dnf config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo
dnf module -y install nvidia-driver:latest-dkms
nvidia-modprobe && nvidia-modprobe -u
dnf -y install nvidia-container-toolkit
nvidia-ctk runtime configure --runtime=docker
systemctl enable --now docker
# usermod -aG docker your_username
