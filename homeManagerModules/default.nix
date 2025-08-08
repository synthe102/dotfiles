{lib, ...}: {
  imports = [
    ./shell
    ./neovim
    ./dev
    ./hyprland
    ./apps
  ];

  shell.enable = lib.mkDefault true;
  neovim.enable = lib.mkDefault true;
  dev = {
    enable = lib.mkDefault true;
  };
  hyprland.enable = lib.mkDefault false;
  chat.enable = lib.mkDefault false;
  music.enable = lib.mkDefault false;
}
