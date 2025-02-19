{
  pkgs,
  lib,
  config,
  user,
  ...
}: let
  homePath =
    if pkgs.stdenv.isDarwin
    then "/Users/${user.name}"
    else "/home/${user.name}";
in {
  options = {
    shell.enable = lib.mkEnableOption "enable shell config";
  };

  config = lib.mkIf config.shell.enable {
    programs = {
      starship.enable = true;
      zsh = {
        enable = true;
        syntaxHighlighting.enable = true;
        oh-my-zsh.enable = true;
        plugins = [
          {
            name = "vi-mode";
            src = pkgs.zsh-vi-mode;
            file = "share/zsh-vi-mode/zsh-vi-mode.plugin.zsh";
          }
        ];
      };
      tmux = {
        enable = true;
        clock24 = true;

        escapeTime = 25;

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
              set -ga terminal-overrides ",xterm-256color:Tc"
            '';
          }
        ];

        extraConfig = ''
          bind | split-window -h
          bind - split-window -v

          set -g focus-events on
          set -g default-command "$SHELL"
        '';
      };
    };

    home.file.".local/bin/tmux-sessionizer" = {
      source = ./scripts/tmux-sessionizer.sh;
      executable = true;
    };

    home.sessionPath = [
      "${homePath}/.local/bin"
      "/opt/homebrew/bin"
    ];
  };
}
