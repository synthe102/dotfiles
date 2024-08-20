{
  lib,
  config,
  pkgs,
  ...
}: {
  imports = [
    ./kubernetes.nix
    ./git.nix
  ];

  options = {
    dev.enable = lib.mkEnableOption "enable neovim";
  };

  config = lib.mkIf config.dev.enable {
    dev = {
      git.enable = lib.mkDefault true;
      kubernetes.enable = lib.mkDefault true;
    };

    programs.direnv = {
      enable = true;
      enableZshIntegration = true;
      nix-direnv.enable = true;
    };
    home.packages = with pkgs; [
      rustup
      alejandra
    ];
  };
}
