#!/bin/bash

# --- Helper function to handle cleaning ---
clean_cache() {
    local name=$1
    local path=$2
    local command=$3

    echo "--- Checking $name ---"
    
    # 1. Try the direct command first
    if [ -n "$command" ] && command -v "${command%% *}" &> /dev/null; then
        echo "Running $name purge command..."
        $command || echo "Warning: $name command failed."
    
    # 2. Special Case: If 'pip' is missing, try to find a pyenv version of it
    elif [[ "$name" == "Pip" ]] && command -v pyenv &> /dev/null; then
        echo "Global 'pip' not found, attempting to use pyenv version..."
        pyenv exec pip cache purge || echo "No pip found in pyenv either."

    # 3. Manual directory cleanup
    elif [ -n "$path" ] && [ -d "$path" ]; then
        if [ "$(ls -A "$path" 2>/dev/null)" ]; then
            echo "Clearing $name cache directory: $path"
            rm -rf "${path:?}"/*
        else
            echo "$name cache is already empty."
        fi
    else
        echo "$name not found or no action needed. Skipping."
    fi
    echo ""
}

## --- 1. Python Ecosystem ---
# This now tries system pip, and falls back to 'pyenv exec pip' if needed
clean_cache "Pip" "" "pip cache purge"
clean_cache "UV" "" "uv cache clean"
clean_cache "Pyenv (Downloads)" "$HOME/.pyenv/cache"
clean_cache "Pre-commit" "$HOME/.cache/pre-commit" "pre-commit clean"

## --- 2. IDEs & Specific Tools ---
# JetBrains
JB_PATH="$HOME/.cache/JetBrains"
[[ "$OSTYPE" == "darwin"* ]] && JB_PATH="$HOME/Library/Caches/JetBrains"
clean_cache "JetBrains" "$JB_PATH"

# Prek (assuming standard cache location)
clean_cache "Prek" "$HOME/.cache/prek"

## --- 3. Containers & System ---
# Docker (Check if daemon is even running first)
if command -v docker &> /dev/null && docker info &> /dev/null; then
    clean_cache "Docker" "" "docker system prune -f"
else
    echo "--- Skipping Docker (Daemon not running or not installed) ---"
fi

# System Journals (Linux Only)
if [[ "$OSTYPE" == "linux-gnu"* ]]; then
    echo "--- Checking System Journals (requires sudo) ---"
    sudo journalctl --vacuum-time=2d || echo "Journal cleanup skipped."
fi

echo "--- Cleanup Complete ---"
