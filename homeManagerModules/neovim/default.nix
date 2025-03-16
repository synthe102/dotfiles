{
  pkgs,
  lib,
  config,
  inputs,
  ...
}: {
  imports = [
    inputs.nixvim.homeManagerModules.nixvim
    ./plugins
    ./options.nix
    ./theme.nix
    ./mappings.nix
  ];

  options = {
    neovim.enable = lib.mkEnableOption "enable neovim";
  };

  config = lib.mkIf config.neovim.enable {
    home.packages = with pkgs; [
      ripgrep
      nodejs_22
    ];

    programs.nixvim = {
      enable = true;
      defaultEditor = true;
      nixpkgs.pkgs = pkgs;

      viAlias = true;
      vimAlias = true;
    };
  };
}
