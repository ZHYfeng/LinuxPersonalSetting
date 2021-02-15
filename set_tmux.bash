#!/bin/bash

TMUX=$HOME/.tmux/plugins/tpm
if [ -d "$TMUX" ]; then
    echo "$TMUX exist"
else 
    git clone https://github.com/tmux-plugins/tpm $TMUX
fi

echo "
unbind C-b
set-option -g prefix C-a
bind-key C-a send-prefix

# List of plugins
set -g @plugin 'tmux-plugins/tpm'
set -g @plugin 'tmux-plugins/tmux-sensible'

# Other examples:
# set -g @plugin 'github_username/plugin_name'
# set -g @plugin 'git@github.com/user/plugin'
# set -g @plugin 'git@bitbucket.com/user/plugin'

set -g @plugin 'tmux-plugins/tmux-resurrect'
set -g @plugin 'tmux-plugins/tmux-continuum'

set -g @continuum-restore 'on'

# Initialize TMUX plugin manager (keep this line at the very bottom of tmux.conf)
run -b '~/.tmux/plugins/tpm/tpm'
" > $HOME/.tmux.conf
# Hit prefix + I to fetch the plugin and source it.