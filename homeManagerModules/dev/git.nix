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
        jujutsu
      ]
      ++ pkgs.lib.optionals isDarwin [ pinentry_mac ];

    programs = {
      gpg.enable = true;
      git = {
        enable = true;
        settings = {
          user = {
            name = "synthe102";
            email = "leonard@suslian.engineer";
          };
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
