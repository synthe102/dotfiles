{
  pkgs,
  lib,
  config,
  ...
}:
{
  options = {
    dev.iac.enable = lib.mkEnableOption "enable git tooling";
  };

  config = lib.mkIf config.dev.iac.enable {
    home.packages = with pkgs;
      [
        tenv
      ];

    programs.zsh = {
      shellAliases = {
        tf = "terraform";
        tg = "terragrunt";
      };
    };
  };
}
