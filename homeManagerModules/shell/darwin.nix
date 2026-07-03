{
  pkgs,
  lib,
  ...
}:
{
  config = lib.mkIf pkgs.stdenv.isDarwin {
    home.sessionVariables = {
      SSH_AUTH_SOCK = "$HOME/Library/Containers/com.maxgoedjen.Secretive.SecretAgent/Data/socket.ssh";
    };
    programs.zsh = {
      shellAliases = {
        tailscale = "/Applications/Tailscale.app/Contents/MacOS/Tailscale";
      };
    };
  };
}
