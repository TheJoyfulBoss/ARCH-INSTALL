#!/usr/bin/env bash
confirm(){
    read -rp "$1 (Y/N): " ans
    [[ "$ans" == "y" || "$ans" == "Y"]]
}
