{
  wayland.windowManager.hyprland = {
    enable = true;
    xwayland.enable = true;
    systemd.enable = true;
    settings = {
      "$mod" = "SUPER";
      monitor = [
        "DP-3,3840x2160@120,0x0,1.25"
        "HDMI-A-1,2560x2880,-2048x-200,1.25"
      ];
      bind =
        [
          "$mod, return, exec, kitty"
          "$mod, F, exec, anyrun"
          "$mod, Q, killactive,"

          "$mod + SHIFT, h, movewindow, l"
          "$mod + SHIFT, j, movewindow, d"
          "$mod + SHIFT, k, movewindow, u"
          "$mod + SHIFT, l, movewindow, r"
          "$mod, h, movefocus, l"
          "$mod, j, movefocus, d"
          "$mod, k, movefocus, u"
          "$mod, l, movefocus, r"
        ]
        ++ (
          builtins.concatLists (builtins.genList (
              x: let
                ws = let
                  c = (x + 1) / 10;
                in
                  builtins.toString (x + 1 - (c * 10));
              in [
                "$mod, ${ws}, workspace, ${toString (x + 1)}"
                "$mod SHIFT, ${ws}, movetoworkspace, ${toString (x + 1)}"
              ]
            )
            10)
        );
      input = {
        kb_layout = "us";
        kb_variant = "intl";
      };
    };
  };

  programs.waybar = {
    enable = true;
    systemd.enable = true;

    settings = [
      {
        layer = "top";
        position = "top";
        height = 40;

        fixed-center = false;

        modules-left = ["hyprland/workspaces"];
        modules-right = [
          "pulseaudio"
          "memory"
          "cpu"
          "clock"

          "tray"
        ];
      }
    ];
    style = builtins.readFile ./style.css;
  };
}
