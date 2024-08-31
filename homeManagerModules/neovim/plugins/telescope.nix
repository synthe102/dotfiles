{
  programs.nixvim = {
    plugins.telescope = {
      enable = true;

      keymaps = {
        "<leader>ff" = "find_files";
        "<leader>fs" = "live_grep";
        "<leader>gb" = "git_branches";
      };

      settings = {
        defaults = {
          file_ignore_patterns = [
            "^.git/"
          ];
        };
        pickers = {
          find_files = {
            hidden = true;
          };
          live_grep = {
            additional_args = [
              "--hidden"
            ];
          };
        };
      };
    };
  };
}
