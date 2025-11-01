{
  pkgs,
  lib,
  config,
  ...
}:
let
  isDarwin = pkgs.stdenv.isDarwin;
in
{
  options = {
    dev.git.enable = lib.mkEnableOption "enable git tooling";
  };

  config = lib.mkIf config.dev.git.enable {
    home.packages =
      with pkgs;
      [
        git
        gh
      ]
      ++ pkgs.lib.optionals isDarwin [ pinentry_mac ];

    programs = {
      gpg.enable = true;
      git = {
        enable = true;
        userName = "synthe102";
        userEmail = "leonard@suslian.engineer";

        extraConfig = {
          safe.directory = "*";
          commit.gpgsign = true;
          gpg.format = "ssh";
          user.signingkey = "~/.ssh/id_ed25519.pub";
          url = {
            "git@github.com:" = {
              insteadOf = "https://github.com/";
            };
          };
        };
      };
    };
  };
}
