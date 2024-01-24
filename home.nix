{ config, pkgs, ... }:

{
  home.username = "synthe";
  home.homeDirectory = "/home/synthe";
  wayland.windowManager.hyprland = {
      enable = true;
      xwayland.enable = true;
      systemd.enable = true;
      settings = {
        "$mod" = "SUPER";
	bind = [
	  "$mod, S, exec, kitty"
	  "$mod, Q, killactive,"
	];
      };
  };

  services = {
    gpg-agent = {
      enable = true;
      enableSshSupport = true;
      pinentryFlavor = "gnome3";
    };
  };

  programs = {
    gpg.enable = true;
    git = {
      enable = true;
      userName = "Leonard Suslian";
      userEmail = "leonard.suslian@gmail.com";
    };
    starship = {
      enable = true;
    };
    kitty = {
      enable = true;
    };
    nushell = {
      enable = true;
    };
  };

  home.packages = with pkgs; [
    neofetch
    nnn

    pavucontrol

    pinentry
    yubikey-personalization

    jq
    btop
    gh
  ];

  home.stateVersion = "23.11";

  programs.home-manager.enable = true;
}
