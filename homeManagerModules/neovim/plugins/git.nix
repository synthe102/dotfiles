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
      {
        mode = "n";
        key = "<leader>gh";
        action = ":Gitsigns stage_hunk<CR>";
        options.silent = true;
      }
      {
        mode = "n";
        key = "<leader>gu";
        action = ":Gitsigns undo_stage_hunk<CR>";
        options.silent = true;
      }
    ];

    plugins.gitsigns = {
      enable = true;
      settings.current_line_blame = true;
    };
    plugins.fugitive.enable = true;
  };
}
