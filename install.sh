#!/usr/bin/env bash
set -e

steps=(
	"lib/disk.sh"
	"lib/utils.sh"
	"steps/00-config.sh"
	"steps/01-preperation.sh"
	"steps/02-disk.sh"
	"steps/03-base.sh"
	"steps/04-chroot.sh"
	"steps/05-user.sh"
	"steps/06-boot.sh"
	"steps/07-profile.sh"
	"steps/08-post_install.sh"
	"steps/09-finish.sh"
)

for step in "${steps[@]}"; do
	echo "Running $step"
	source "$step"
done