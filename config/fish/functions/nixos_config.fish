function nixos_config --description 'Open the NixOS Configuration'
    if test -d /etc/nixos
        pushd /etc/nixos
        direnv exec . $SHELL -c nvim
        popd
    else
        echo "this is $(sed -n "/^NAME=/s/^NAME=//p" /etc/os-release) not NixOS"
    end
end
