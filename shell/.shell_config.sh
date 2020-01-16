if [-f ~/.local/lib/python3.6/site-packages/powerline/bindings/bash/powerline.sh ]; then
    powerline-daemon -q
    export POWERLINE_BASH_CONTINUATION=1
    export POWERLINE_BASH_SELECT=1
    . ~/.local/lib/python3.6/site-packages/powerline/bindings/bash/powerline.sh
fi

[ -f ~/.bash_aliases ] && source ~/.bash_aliases
[ -f ~/.fzf.bash ] && source ~/.fzf.bash

