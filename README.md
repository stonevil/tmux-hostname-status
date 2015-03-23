# Tmux Hostname status

Tmux plugin that enables displaying host name and OS (OS X OR Linux) for you tmux session.

Introduces a new `#{hostname_status}` format.

This plugin is useful if:
- need to know external where you are now.

### Usage

Add `#{hostname_status}` format string to your existing `status-left` tmux option.


Here's the example in `.tmux.conf`:

    set -g status-left "#{hostname_status} "

#### Configure icons
If the icons don't display well on your machine you can change them in
`.tmux.conf`:

    set -g @hostname_icon_osx "rMBP"
    set -g @hostname_icon "myLinux"
    
#### Configure hostname type
You can control short OR FQDN host name to show in
`.tmux.conf`:

    set -g @hostname_type "short"

### Installation with [Tmux Plugin Manager](https://github.com/tmux-plugins/tpm) (recommended)

Add plugin to the list of TPM plugins in `.tmux.conf`:

    set -g @tpm_plugins "                 \
      tmux-plugins/tpm                    \
      stonevil/tmux-hostname-status       \
    "

Hit `prefix + I` to fetch the plugin and source it.

`#{hostname_status}` interpolation should now work.

### Manual Installation

Clone the repo:

    $ git clone https://github.com/stonevil/tmux-hostname-status ~/clone/path

Add this line to the bottom of `.tmux.conf`:

    run-shell ~/clone/path/hostname_status.tmux

Reload TMUX environment:

    # type this in terminal
    $ tmux source-file ~/.tmux.conf

`#{hostname_status}` interpolation should now work.

### Limitations

Hostname status icon most likely won't be instant. The duration depends on the `status-interval` Tmux option. So, it might take anywhere between 5 and 60 seconds for host name status icon to change.

Set `status-interval` to a low number to make this faster, example:

    # in .tmux.conf
    set -g status-interval 5

### Other plugins

You might also find these useful:

- [wan-status](https://github.com/stonevil/tmux-wan-status) - WAN status and IP
- [lan-status](https://github.com/stonevil/tmux-lan-status) - LAN status and IP
- [vm-status](https://github.com/stonevil/tmux-vm-status) - started Virtual Machines status

### License

[MIT](LICENSE.md)
