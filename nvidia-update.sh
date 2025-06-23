#! /usr/bin/env bash

VERSION=$1
if [ -z "$VERSION" ]; then
  echo "Usage: $0 <version>"
  exit 1
fi

curl -L https://us.download.nvidia.com/tesla/"$VERSION"/NVIDIA-Linux-aarch64-"$VERSION".run -o /tmp/NVIDIA-Linux-aarch64-"$VERSION".run
curl -L https://us.download.nvidia.com/tesla/"$VERSION"/NVIDIA-Linux-x86_64-"$VERSION".run -o /tmp/NVIDIA-Linux-x86_64-"$VERSION".run

sha256sum /tmp/NVIDIA-Linux-aarch64-"$VERSION".run /tmp/NVIDIA-Linux-x86_64-"$VERSION".run
sha512sum /tmp/NVIDIA-Linux-aarch64-"$VERSION".run /tmp/NVIDIA-Linux-x86_64-"$VERSION".run

rm -f /tmp/NVIDIA-Linux-aarch64-"$VERSION".run /tmp/NVIDIA-Linux-x86_64-"$VERSION".run

curl -L https://developer.download.nvidia.com/compute/nvidia-driver/redist/fabricmanager/linux-sbsa/fabricmanager-linux-sbsa-"$VERSION"-archive.tar.xz -o /tmp/fabricmanager-linux-sbsa-"$VERSION"-archive.tar.xz
curl -L https://developer.download.nvidia.com/compute/nvidia-driver/redist/fabricmanager/linux-x86_64/fabricmanager-linux-x86_64-"$VERSION"-archive.tar.xz -o /tmp/fabricmanager-linux-x86_64-"$VERSION"-archive.tar.xz

sha256sum /tmp/fabricmanager-linux-sbsa-"$VERSION"-archive.tar.xz /tmp/fabricmanager-linux-x86_64-"$VERSION"-archive.tar.xz
sha512sum /tmp/fabricmanager-linux-sbsa-"$VERSION"-archive.tar.xz /tmp/fabricmanager-linux-x86_64-"$VERSION"-archive.tar.xz

rm -f /tmp/fabricmanager-linux-sbsa-"$VERSION"-archive.tar.xz /tmp/fabricmanager-linux-x86_64-"$VERSION"-archive.tar.xz
