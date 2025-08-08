{
  pkgs,
  lib,
  config,
  inputs,
  ...
}: {
  imports = [
    inputs.catppuccin.homeModules.catppuccin
  ];

  options = {
    hyprland.enable = lib.mkEnableOption "enable hyprland";
  };
  config = lib.mkIf config.hyprland.enable {
    programs.ghostty.enable = true;
    catppuccin = {
      enable = true;
      atuin.enable = false;
    };
    gtk = {
      enable = true;
      theme = {
        name = "Adwaita-dark";
        package = pkgs.gnome-themes-extra;
      };
      gtk3.extraConfig.gtk-application-prefer-dark-theme = 1;
      gtk4.extraConfig.gtk-application-prefer-dark-theme = 1;
    };
    qt = {
      enable = true;
      style = {
        name = "kvantum";
      };
      platformTheme.name = "kvantum";
    };
    dconf.settings = {
      "org/gnome/desktop/interface".color-scheme = "prefer-dark";
    };
    programs.rofi = {
      enable = true;
      font = "FiraCode Nerd Font Mono 14";
    };
    wayland.windowManager.hyprland = {
      enable = true;
      package = null;
      portalPackage = null;
      systemd.variables = ["--all"];
      settings = {
        "$mod" = "SUPER";
        "$terminal" = "ghostty";
        monitor = [
          "DP-3, highrr, 0x0, 1.25"
          "HDMI-A-2, preferred, auto-center-left, 1.25"
        ];
        bind =
          [
            "$mod, RETURN, exec, $terminal"
            "ALT, SPACE, exec, rofi -show drun"
            "$mod, Q, killactive,"
            "$mod, H, movefocus, l"
            "$mod, J, movefocus, d"
            "$mod, K, movefocus, u"
            "$mod, L, movefocus, r"
            "$mod SHIFT, H, movewindow, l"
            "$mod SHIFT, J, movewindow, d"
            "$mod SHIFT, K, movewindow, u"
            "$mod SHIFT, L, movewindow, r"
          ]
          ++ (
            # workspaces
            # binds $mod + [shift +] {1..9} to [move to] workspace {1..9}
            builtins.concatLists (
              builtins.genList (
                i: let
                  ws = i + 1;
                in [
                  "$mod, code:1${toString i}, workspace, ${toString ws}"
                  "$mod SHIFT, code:1${toString i}, movetoworkspace, ${toString ws}"
                ]
              )
              9
            )
          );
      };
    };
    programs.hyprpanel = {
      enable = true;
      systemd.enable = true;
    };
  };
}
