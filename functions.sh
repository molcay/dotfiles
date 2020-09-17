# FUNCTIONS file

histrm() {
  LC_ALL=C sed -i '' '/$1/d' $HISTFILE
}

cleanHistory() {
  cat /dev/null > ~/.bash_history && cat /dev/null > ~/.zsh_history && exit
}

createPythonProject() {
    if [ -z "$1" ]
    then
         echo "No argument supplied"
         exit 1
    fi
    mkdir $1
    cd $1
    python3 -m venv .venv
    .venv/bin/activate/pip install --upgrade pip
    echo "Ready for hunt..."
}

## Macos
addSpacer() {
  defaults write com.apple.dock persistent-apps -array-add '{"tile-type"="spacer-tile";}'
}

$DEBUG || echo 'functions [OK]'
