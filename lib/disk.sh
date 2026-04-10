#!/usr/bin/env bash

list_disk() {
    lsblk -d -o NAME,SIZE,TYPE | grep disk
}

choose_disk() {
    list_disk
    echo
    read -rp "Enter disk (e.g /dev/sda: )" disk
    echo "$disk"
}

validate_disk(){
    [[ -b "$1"]] || { echo "invalid disk"; exit 1; }
}