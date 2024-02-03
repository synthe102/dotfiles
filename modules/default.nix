{ config, pkgs, ... }: {
  imports = [
    ./nvim
    ./tmux
    ./hyprland
  ];
}
