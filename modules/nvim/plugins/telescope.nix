{
  programs.nixvim = {
    plugins = {
      telescope = {
        enable = true;
        keymaps = {
          "<leader>ff" = "find_files";
          "<leader>fs" = "live_grep";
        };
      };
    };
  };
}
