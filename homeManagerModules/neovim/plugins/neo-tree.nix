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
      settings = {
        close_if_last_window = true;
        filesystem = {
          window.mappings = {
            "<tab>" = "toggle_node";
          };
          filteredItems.visible = true;
        };
      };
    };
  };
}
