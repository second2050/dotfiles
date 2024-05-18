#!/usr/bin/env bash

# environment variables
## PATH
export PATH=$HOME/.local/bin:$PATH

## XDG
export XDG_CONFIG_HOME=$HOME/.config
export XDG_CACHE_HOME=$HOME/.cache
export XDG_DATA_HOME=$HOME/.local/share
export XDG_STATE_HOME=$HOME/.local/state

## SSH Agent
if which goldwarden &> /dev/null; then
    export GOLDWARDEN_SOCKET_PATH="$HOME/.goldwarden.socket"
    export GOLDWARDEN_SSH_AUTH_SOCKET="$HOME/.goldwarden-ssh-agent.sock"
    export SSH_AUTH_SOCK="$GOLDWARDEN_SSH_AUTH_SOCKET"
else
    eval $(ssh-agent) > /dev/null # silence agent!
    export SSH_ASKPASS=/usr/bin/ksshaskpass
    #export SSH_ASKPASS_REQUIRE=prefer
fi

## IME
export GTK_IM_MODULE=fcitx
export QT_IM_MODULE=fcitx
export XMODIFIERS=@im=fcitx

## GTK 
export GDK_DEBUG=portals

## MangoHud
export MANGOHUD=1

# Wayland specifics
if [ "$XDG_SESSION_TYPE" == "wayland" ]; then
    ## Firefox
    export MOZ_ENABLE_WAYLAND=1
    export MOZ_DBUS_REMOTE=1
fi
# X11 specifics
if [ "$XDG_SESSION_TYPE" == "x11" ]; then
    ## Firefox
    export MOZ_USE_XINPUT2=1
fi

# Desktop Environment specifics
if [ "$XDG_SESSION_DESKTOP" == "KDE" ]; then
    ## PinEntry: disable deadlock protection
    export PINENTRY_KDE_USE_WALLET=1
fi

