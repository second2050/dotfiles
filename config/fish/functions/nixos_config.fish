function nixos_config --description 'Open the NixOS Configuration'
    pushd /etc/nixos
    nvim
    popd
end
