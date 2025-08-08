{
  imports = [
    ./virt.nix
    ./docker.nix
  ];
  programs.nix-ld.enable = true;
  services.gnome.gnome-keyring.enable = true;
}
