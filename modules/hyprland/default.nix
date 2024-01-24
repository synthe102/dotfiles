{
  wayland.windowManager.hyprland = {
      enable = true;
      xwayland.enable = true;
      systemd.enable = true;
      settings = {
        "$mod" = "SUPER";
	bind = [
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
}
