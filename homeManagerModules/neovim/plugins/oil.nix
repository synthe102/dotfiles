{
  programs.nixvim = {
    keymaps = [
      {
        mode = "n";
        key = "<leader>o";
        action = ":Oil<CR>";
        options.silent = true;
      }
    ];

    plugins.oil = {
      enable = true;
    };
  };
}
