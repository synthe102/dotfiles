{
  programs.nixvim = {
    plugins.telescope = {
      enable = true;

      keymaps = {
        "<leader>ff" = "find_files";
        "<leader>fs" = "live_grep";
        "<leader>gb" = "git_branches";
      };

      settings.defaults = {
        file_ignore_patterns = [
          "^.git/"
        ];
      };
    };
  };
}
