{ pkgs, ...}: {
  programs.tmux = {
    enable = true;
    clock24 = true;

    escapeTime = 50;

    keyMode = "vi";
    customPaneNavigationAndResize = true;

    shortcut = "a";
    baseIndex = 1;
    mouse = true;

    plugins = with pkgs; [
      {
        plugin = tmuxPlugins.catppuccin;
        extraConfig = ''
          set -g @catppuccin_window_right_separator " "
          set -g @catppuccin_window_current_text "#W"
          set -g @catppuccin_window_default_text "#W"
        '';
      }
    ];
    
    extraConfig = ''
      bind | split-window -h
      bind - split-window -v

      set -g focus-events on
    '';
  };

  home.file.".local/bin/tmux-sessionizer" = {
    source = ./scripts/tmux-sessionizer.sh;
    executable = true;
  };
}
