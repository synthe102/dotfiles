{
  pkgs,
  lib,
  config,
  ...
}: {
  options = {
    dev.git.enable = lib.mkEnableOption "enable k8s tooling";
  };

  config = lib.mkIf config.dev.git.enable {
    home.packages = with pkgs; [
      gh
      pinentry_mac
    ];

    programs = {
      gpg.enable = true;
      git = {
        enable = true;
        userName = "Léonard Suslian";
        userEmail = "leonard@suslian.engineer";

        extraConfig = {
          commit.gpgsign = true;
          gpg.format = "ssh";
          user.signingkey = "~/.ssh/id_ed25519.pub";
        };
      };
    };
  };
}
