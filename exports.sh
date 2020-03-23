# EXPORTS file

## Set must-have variables
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

### Flutter SDK
export FLUTTER_HOME="$HOME/Programs/flutter"

## Add folders to PATH
export PATH="/usr/local/opt/gnu-getopt/bin:$PATH"
export PATH="/opt/local/bin:$PATH"
export PATH="$HOME/Programs:$PATH"
export PATH="$HOME/Library/Python/3.6/bin:$PATH"
export PATH="$HOME/Programs/:$PATH"
export PATH="$PATH":"$HOME/.pub-cache/bin"
export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"
export PATH="$HOME/Programs/jetbrains/:$PATH"
export PATH="$HOME/Programs/flutter/.pub-cache/bin:$PATH"
export PATH="$FLUTTER_HOME/bin:$PATH"

## Creds
### Personal
export GITHUB_TFONTF_TOKEN="f9f78cc2d1bc472841986429a50937004f95c10e"

### AWS CLI
# export PATH="$PATH:$HOME/Programs/aws.d/bin"
# export AWS_PROFILE="cyngn"

# bat
export BAT_THEME="TwoDark"

$DEBUG || echo 'exports [OK]'
