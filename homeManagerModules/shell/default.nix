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
    home.shell.enableZshIntegration = true;
    programs = {
      atuin = {
        enable = true;
      };
      starship.enable = true;
      zsh = {
        enable = true;
        defaultKeymap = "viins";
        syntaxHighlighting.enable = true;
        autosuggestion.enable = true;
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
              set -g @catppuccin_flavor "mocha"
              set -g @catppuccin_window_current_text " #{pane_current_command}"
              set -g @catppuccin_window_text " #{pane_current_command}"
              set -ga terminal-overrides ",xterm-256color:Tc"
              set -g status-right-length 100
              set -g status-left-length 100
              set -g status-left ""
              set -g status-right "#{E:@catppuccin_status_session}"
              set -ag status-right "#{E:@catppuccin_status_date_time}"
              set -g @catppuccin_status_left_separator "█"
            '';
          }
        ];

        extraConfig = ''
          bind | split-window -h
          bind - split-window -v

          set -g focus-events on
        '';
      };
    };

    home.file.".local/bin/tmux-sessionizer" = {
      source = ./scripts/tmux-sessionizer.sh;
      executable = true;
    };

    home.sessionPath = [
      "${homePath}/.local/bin"
      "${homePath}/.krew/bin"
      "/opt/homebrew/bin"
    ];
  };
}
