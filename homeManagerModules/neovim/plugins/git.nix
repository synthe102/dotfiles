{
  programs.nixvim = {
    keymaps = [
      {
        mode = "n";
        key = "<leader>gs";
        action = ":Git <CR>";
        options.silent = true;
      }
      {
        mode = "n";
        key = "<leader>gc";
        action = ":Git commit<CR>";
        options.silent = true;
      }
    ];

    plugins.gitsigns.enable = true;
    plugins.fugitive.enable = true;
  };
}
