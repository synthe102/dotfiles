{ pkgs, ...}: {
  programs.tmux = {
    enable = true;
    clock24 = true;

    escapeTime = 50;

    keyMode = "vi";
    customPaneNavigationAndResize = true;

    shortcut = "a";

    plugins = with pkgs.tmuxPlugins; [
      catppuccin
    ];
    
    extraConfig = ''
      set -g mouse on

      bind | split-window -h
      bind - split-window -v

      set -g focus-events on

      set -g automatic-rename
      set -g automatic-rename-format '#{pane_current_command}'
      set -g base-index 1
      setw -g pane-base-index 1
    '';
  };
}
