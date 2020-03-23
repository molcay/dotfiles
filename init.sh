# Source other files
[ -f ~/.dotfiles/aliases.bashrc ] && source ~/.dotfiles/aliases.sh
[ -f ~/.dotfiles/exports.bashrc ] && source ~/.dotfiles/exports.sh
[ -f ~/.dotfiles/functions.bashrc ] && source ~/.dotfiles/functions.sh

# SOURCEs
$DEBUG || echo "gcloud path.zsh.inc"
[ -f /Users/molcay/Programs/google-cloud-sdk/path.zsh.inc ] && source /Users/molcay/Programs/google-cloud-sdk/path.zsh.inc
$DEBUG || echo "gcloud completion.zsh.inc"
[ -f /Users/molcay/Programs/google-cloud-sdk/completion.zsh.inc ] && source /Users/molcay/Programs/google-cloud-sdk/completion.zsh.inc

$DEBUG || echo "bgnotify.plugin.zsh"
[ -f /Users/molcay/.zsh-background-notify/bgnotify.plugin.zsh ] &&source /Users/molcay/.zsh-background-notify/bgnotify.plugin.zsh

$DEBUG || echo "sdkman-init.sh"
[ -f $HOME/.sdkman/bin/sdkman-init.sh ] && source "$HOME/.sdkman/bin/sdkman-init.sh"

##################################################

# PROGRAMS SPECIFICs
# THE FUCK
$DEBUG || echo "eval thefuck alias"
command -v thefuck && eval $(thefuck --alias)

# NVM
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# SDKMAN
#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="/Users/molcay/.sdkman"
[[ -s "/Users/molcay/.sdkman/bin/sdkman-init.sh" ]] && source "/Users/molcay/.sdkman/bin/sdkman-init.sh"

# added by travis gem
$DEBUG || echo "travis"
[ -f /Users/molcay/.travis/travis.sh ] && source /Users/molcay/.travis/travis.sh


$DEBUG || echo "gvm"
[[ -s "/Users/molcay/.gvm/scripts/gvm" ]] && source "/Users/molcay/.gvm/scripts/gvm"

# heroku autocomplete setup
$DEBUG || echo "HEROKU"
HEROKU_AC_ZSH_SETUP_PATH=/Users/molcay/Library/Caches/heroku/autocomplete/zsh_setup && test -f $HEROKU_AC_ZSH_SETUP_PATH && source $HEROKU_AC_ZSH_SETUP_PATH;

$DEBUG || echo "iterm2_shell_integration.zsh"
test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

###
ulimit -S -n 2048 # max opened file count

# Pipenv completion
# $DEBUG || echo "eval pipenv --completion"
# eval "$(pipenv --completion)"

# starship prompt
command -v starship && eval "$(starship init zsh)"
