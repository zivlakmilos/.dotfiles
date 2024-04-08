#!/usr/bin/env bash

systemctl start libvirtd.service && sudo virsh net-start default
