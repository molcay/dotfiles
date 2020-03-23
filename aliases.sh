#!/usr/bin/env bash

# Directory Navigation Related
alias ..="cd .."
alias ...="cd ../.."

# Directory Info
alias ll="ls -la $@"
alias llh="ls -lah"
alias bul="locate $@"
alias bulg="locate | grep $@"
alias listg="ls -la | grep $@"
alias islem="ps -efl $@"
alias islemg="ps -efl | grep $@"
alias nanca="du -hd 1"

# Command
## Python
alias cvenv="python3 -m venv $@"  # Create virtual environment with given name
alias upgpip="pip install --upgrade pip"  # Upgrade PIP
alias managepy="python3 manage.py"  # Django App Manager
alias httpServer="python3 -m http.server $@"  # Start Simple HTTP Server
alias activate="source myvenv/bin/activate"  # Activate virtual environment for Python

## JVM Related
alias sbtDebug="sbt -jvm-debug 5005"

## SSH
alias evalssha='eval "$(ssh-agent -s)"'
alias sshadd="ssh-add -K ~/.ssh/id_rsa"

## Binaries
alias ngrok='~/Programs/ngrok/ngrok'
alias micro='~/Programs/micro'

## Mac OS
alias addSpaceToDock=$'defaults write com.apple.dock persistent-apps -array-add \'{"tile-type"="spacer-tile";}\' && killall Dock'
alias showFiles='defaults write com.apple.finder AppleShowAllFiles YES; killall Finder /System/Library/CoreServices/Finder.app'
alias hideFiles='defaults write com.apple.finder AppleShowAllFiles NO; killall Finder /System/Library/CoreServices/Finder.app'

$DEBUG || echo 'aliases [OK]'
