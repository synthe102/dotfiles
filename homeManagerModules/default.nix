{lib, ...}: {
  imports = [
    ./shell
    ./neovim.nix
    ./dev
  ];

  shell.enable = lib.mkDefault true;
  neovim.enable = lib.mkDefault true;
  dev = {
    enable = lib.mkDefault true;
  };
}
