{
  pkgs,
  lib,
  ...
}:
{
  config = lib.mkIf pkgs.stdenv.isDarwin {
    programs.zsh = {
      shellAliases = {
        tailscale = "/Applications/Tailscale.app/Contents/MacOS/Tailscale";
      };
    };
  };
}
