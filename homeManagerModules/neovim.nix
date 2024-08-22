{
  pkgs,
  lib,
  config,
  ...
}: {
  options = {
    neovim.enable = lib.mkEnableOption "enable neovim";
  };

  config = lib.mkIf config.neovim.enable {
    home.packages = with pkgs; [
      neovim
      ripgrep
      nodejs_22
    ];

    home.sessionVariables = {
      EDITOR = "nvim";
    };
  };
}
