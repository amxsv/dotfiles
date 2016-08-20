# Brew commands
alias brewu='brew update && brew upgrade && brew cleanup --force && brew prune && brew doctor'

# Alias vim to nvim
alias vim='nvim'

# TLDR https://github.com/tldr-pages/tldr
alias mant='tldr'

# Run rake tests and rubocop checks
alias rtest='bundle exec rake test && bundle exec rubocop'

# Brew services
alias services='brew services'

# Safe rm
alias rm="rm -i"

# Docker aliases
alias dc='docker-compose'
alias drmin='docker images | grep none | tr -s " " | cut -d" " -f 3 | xargs docker rmi'
alias dimgs='docker images'
alias drma='docker ps -aq | xargs docker rm -f'
alias docker_runit='docker run -it --rm $@'
alias docker_runit_here='docker run -v $(PWD):/app -w /app -it --rm $@'
alias dpsa='docker ps -a'

# wp-cli completion script
source /Users/maksim/.wp-completion.bash

# Vagrant aliases
alias v='vagrant'
alias vh='vagrant halt'
alias vs='vagrant up && vagrant ssh'
alias vst='vagrant up && vagrant ssh -c "tmux -CC"'

alias l='ls -lhaG'
alias g='git'

# Up 'n' folders
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'

# Grep with color
alias grep='grep --color=auto '

# Find all cyr symbols
alias cyr='grep "[А-я,Ё,ё]" '

# Show all files extensions
alias lfe="find . -type f | sed -En 's|.*/[^/]+\.([^/.]+)$|\1|p' | sort -u"

# Case insensitive completion
bind 'set completion-ignore-case on'

# Add homebrew sbin to PATH variable
export PATH="/usr/local/sbin:$HOME/.rvm/bin:$PATH"

## History configuration
# Appending history instead of rewriting
shopt -s histappend

# Ignore duplicates while appending and erase duplicates from old history
HISTCONTROL=ignoredups:erasedups

# Ignore aliases and some other patterns when write history
HISTIGNORE="$(alias | cut -d' ' -f2 | cut -d'=' -f1 | tr '\n' ':')[bf]g:exit:pwd:ls:cd:vi"

## Prompt configuration
if [ -f ~/.git-prompt.sh ]; then
    . ~/.git-prompt.sh
fi

if [ -f /usr/local/etc/bash_completion.d/git-completion.bash ]; then
  . /usr/local/etc/bash_completion.d/git-completion.bash
fi

# Show unstaged (*) and staged (+) changes next to the branch name.
GIT_PS1_SHOWDIRTYSTATE=1
# If something is stashed, then a '$' will be shown next to the branch name.
GIT_PS1_SHOWSTASHSTATE=1
# If there're untracked files, then a '%' will be shown next to the branch name.
GIT_PS1_SHOWUNTRACKEDFILES=1
# Show the difference between HEAD and its upstream with number of commits ahead/behind (+/-) upstream
GIT_PS1_SHOWUPSTREAM="auto verbose"

set_prompt () {
    orange='\[\033[0;33m\]'
    reset='\[\e[00m\]'
    PS1="$(__git_ps1) $orange\W\$$reset "
}
PROMPT_COMMAND=set_prompt

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

