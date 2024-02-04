{ config, pkgs, inputs, ... }:

{
  home.username = "synthe";
  home.homeDirectory = "/home/synthe";

  imports = [
    ./modules
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
        plugins = with inputs.anyrun.packages.${pkgs.system}; [
          applications
          randr
          shell
          symbols
	      ];
        width.fraction = 0.3;
        y.absolute = 30;
        hidePluginInfo = true;
        closeOnClick = true;
      };

      extraCss = ''
        @define-color bg-col  rgba(30, 30, 46, 0.7);
        @define-color bg-col-light rgba(150, 220, 235, 0.7);
        @define-color border-col rgba(30, 30, 46, 0.7);
        @define-color selected-col rgba(150, 205, 251, 0.7);
        @define-color fg-col #D9E0EE;
        @define-color fg-col2 #F28FAD;

        * {
          transition: 200ms ease;
          font-family: "JetBrainsMono Nerd Font";
          font-size: 1.3rem;
        }

        #window {
          background: transparent;
        }

        #plugin,
        #main {
          border: 3px solid @border-col;
          color: @fg-col;
          background-color: @bg-col;
        }
        /* anyrun's input window - Text */
        #entry {
          color: @fg-col;
          background-color: @bg-col;
        }

        /* anyrun's ouput matches entries - Base */
        #match {
          color: @fg-col;
          background: @bg-col;
        }

        /* anyrun's selected entry - Red */
        #match:selected {
          color: @fg-col2;
          background: @selected-col;
        }

        #match {
          padding: 3px;
          border-radius: 16px;
        }

        #entry, #plugin:hover {
          border-radius: 16px;
        }

        box#main {
          background: rgba(30, 30, 46, 0.7);
          border: 1px solid @border-col;
          border-radius: 15px;
          padding: 5px;
        }
      '';
    };
    git = {
      enable = true;
      userName = "Leonard Suslian";
      userEmail = "leonard.suslian@konghq.com";
      signing = {
        signByDefault = true;
        key = "A94C18A1F2FDBAB8";
      };
    };
    starship = {
      enable = true;
    };
    kitty = {
      enable = true;
      theme = "Catppuccin-Mocha";
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
  $env.PATH = ($env.PATH | split row (char esep) | append "/home/synthe/.local/bin")
      '';
      shellAliases = {
        k = "kubectl";
      };
    };
    direnv = {
      enable = true;
      enableBashIntegration = true;
      nix-direnv.enable = true;
    };
    bash.enable = true;
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
    fzf
    ripgrep
    btop
    gh
    kind
    kubectl
    k9s
  ];

  home.stateVersion = "23.11";

  programs.home-manager.enable = true;
}
