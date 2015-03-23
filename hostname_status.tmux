#!/usr/bin/env bash

CURRENT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

source $CURRENT_DIR/scripts/helpers.sh

hostname_status="#($CURRENT_DIR/scripts/hostname_status.sh)"
hostname_status_interpolation_string="\#{hostname_status}"

do_interpolation() {
	local string=$1
	local interpolated=${string/$hostname_status_interpolation_string/$hostname_status}
	echo "$interpolated"
}

main() {
	update_tmux_option "status-left"
	update_tmux_option "status-right"
}
main
