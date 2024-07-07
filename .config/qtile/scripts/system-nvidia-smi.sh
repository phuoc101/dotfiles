#!/bin/sh

NVIDIA_STAT=$(nvidia-smi --query-gpu=utilization.gpu --format=csv,noheader,nounits | awk '{ print "󰍛 "$1"%"}')
echo " $NVIDIA_STAT "
