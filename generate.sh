#!/bin/bash
set -eux

ubuntu_tag () {
  echo "ubuntu${UBUNTU_VERSION//./}-cuda${CUDA_VERSION//./_}"
}

generate () {
  tag=$(ubuntu_tag)
  echo $tag
  sed -e "s/CUDA_VERSION/${CUDA_VERSION}/" \
      -e "s/UBUNTU_VERSION/${UBUNTU_VERSION}/" \
      < ubuntu.Dockerfile > Dockerfile
  git branch -D $tag || true
  git checkout -b $tag
  git add Dockerfile
  git commit -m "Ubuntu ${UBUNTU_VERSION} with CUDA ${CUDA_VERSION}"
  git checkout -
}

tags=()

UBUNTU_VERSION=16.04
for CUDA_VERSION in 8.0 9.0 9.1 9.2 10.0 10.1 10.2; do
  generate
  tags=($(ubuntu_tag) "${tags[@]}")
done

UBUNTU_VERSION=18.04
for CUDA_VERSION in 9.2 10.0 10.1 10.2; do
  generate
  tags=($(ubuntu_tag) "${tags[@]}")
done

if [[ -n "${PUBLISH:-}" ]]; then
  git push origin "${tags[@]}" -f
fi
