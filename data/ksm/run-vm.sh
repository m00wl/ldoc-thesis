#!/usr/bin/env sh
set -x
sudo qemu-system-aarch64                          \
  -machine virt                                   \
  -cpu host                                       \
  -enable-kvm                                     \
  -m 1G                                           \
  -kernel vmlinux.img                             \
  -append 'ramdisk_size=300000 root=/dev/ram0 rw' \
  -initrd ramdisk-benchmark.rd                    \
  -nographic
