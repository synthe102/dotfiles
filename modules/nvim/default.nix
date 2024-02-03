{ config, ...}: {
  imports = [
    ./plugins
    ./ui.nix
    ./options.nix
    ./keymaps.nix
  ];

  programs.nixvim = {
    enable = true;
    defaultEditor = true;

    viAlias = true;
    vimAlias = true;
  };
}
