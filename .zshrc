export ZSH=/home/b3llonn3/.oh-my-zsh
ZSH_THEME="robbyrussell"
plugins=(archlinux docker gem git rails sudo tig virtualenvwrapper)
source $ZSH/oh-my-zsh.sh

export VISUAL=vim
export EDITOR=vim

eval "$(rbenv init -)"
export GEM_HOME=$(ruby -e 'print Gem.user_dir')

export PATH="/usr/local/bin:$GEM_HOME/bin:$HOME/bin:$HOME/.rbenv/bin:$PATH:$HOME/.npm-global/bin"

# handle only one ssh-agent
if ! pgrep -u "$USER" ssh-agent > /dev/null; then
    ssh-agent > ~/.ssh-agent-pid
fi
if [[ "$SSH_AGENT_PID" == "" ]]; then
    eval "$(<~/.ssh-agent-pid)"
fi
# start gpg if not previously started
if ! pgrep -u "$USER" gpg-agent > /dev/null; then
    eval $(gpg-agent --daemon)
fi

# python varenv
export VIRTUALENVWRAPPER_PYTHON=/usr/bin/python3.6

# You may need to manually set your language environment
export LANG=fr_FR.UTF-8

# alias
alias rails="bundle exec rails"
alias autormv="sudo pacman -Rns $(pacman -Qtdq)"
