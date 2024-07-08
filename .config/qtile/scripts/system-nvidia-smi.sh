#!/bin/sh

NVIDIA_STAT=$(nvidia-smi --query-gpu=utilization.gpu --format=csv,noheader,nounits | awk '{ print "󰍛 "$1"%"}')
printf " %-3s " $NVIDIA_STAT
