{
  programs.nixvim = {
    plugins.which-key = {
      enable = true;
    };
    keymaps = [
      {
        mode = "n";
        key = "<Esc>";
        action = ":nohl<CR>";
        options.silent = true;
      }
      {
        mode = "n";
        key = "<leader>x";
        action = ":Bdelete<CR>";
        options.silent = true;
      }
    ];
  };
}
