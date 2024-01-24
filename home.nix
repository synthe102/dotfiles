{ config, pkgs, inputs, ... }:

{
  home.username = "synthe";
  home.homeDirectory = "/home/synthe";

  imports = [
    ./modules/hyprland
    ./modules/nvim
  ];

  services = {
    gpg-agent = {
      enable = true;
      enableSshSupport = true;
      pinentryFlavor = "gnome3";
    };
  };

  programs = {
    gpg.enable = true;
    anyrun = {
      enable = true;
      config = {
        plugins = [
	  inputs.anyrun.packages.${pkgs.system}.applications
	];
      };
    };
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
      settings = {
        font_family = "FiraCode Nerd Font Mono Med";
	font_size = "15.0";
      };
    };
    nushell = {
      enable = true;
      extraConfig = ''
        $env.config = {
	  show_banner: false,
	};
      '';
    };
  };

  home.packages = with pkgs; [
    spotify
    discord
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
