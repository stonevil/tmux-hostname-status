#!/usr/bin/env bash

CURRENT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

source "$CURRENT_DIR/helpers.sh"

hostname_option_string="@hostname_icon"

hostname_type="full" #possible values: full OR short

hostname_icon_osx=" "
hostname_icon="☭ "

hostname_icon_default() {
	if is_osx; then
		echo "$hostname_icon_osx"
	else
		echo "$hostname_icon"
	fi
}

hostname_status() {
	if is_osx || is_linux; then
    if [ $hostname_type == "full" ]; then
      hostname -f
    else
      hostname -s
    fi
  fi
}

print_hostname_status() {
	# spacer fixes weird emoji spacing
	local spacer=" "
  if [ -n $(hostname_status) ]; then
    printf "$(get_tmux_option "$hostname_option_string" "$(hostname_icon_default)")$spacer$(hostname_status)"
	fi
}

main() {
  print_hostname_status
}
main
