#!/usr/bin/env bash
set -e 

#set system time and date
timdatectl set-ntp true
echo "enabled NTP"