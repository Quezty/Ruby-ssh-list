desktop:
    echo 'updating nixvim to newest release'
    nix flake lock --update-input my-nixvim ~/repos/NixosConfiguration/
    echo 'updating system configuration'
    sudo nixos-rebuild switch --flake ~/repos/NixosConfiguration#desktop