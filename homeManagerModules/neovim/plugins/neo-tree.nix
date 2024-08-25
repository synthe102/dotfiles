{
  programs.nixvim = {
    keymaps = [
      {
        mode = "n";
        key = "<leader>e";
        action = ":Neotree action=focus reveal toggle<CR>";
        options.silent = true;
      }
    ];

    plugins.neo-tree = {
      enable = true;
      closeIfLastWindow = true;
      filesystem.window.mappings = {
        "<tab>" = "toggle_node";
      };
    };
  };
}
