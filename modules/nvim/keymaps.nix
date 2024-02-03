{
  programs.nixvim = {
    globals = {
      mapleader = " ";
    };

    keymaps = [
      {
        mode = "n";
        key = "<leader>e";
        action = ":Neotree action=focus reveal toggle<CR>";
        options.silent = true;
      }
      {
        mode = "n";
        key = "<leader>lt";
        action = ":TroubleToggle<CR>";
        options.silent = true;
      }
      {
        mode = "n";
        key = "<leader>gs";
        action = ":G<CR>";
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
        key = "<leader>gc";
        action = ":Git commit<CR>";
        options.silent = true;
      }
      {
        mode = "n";
        key = "<C-h>";
        action = "<C-w>h";
        options.silent = true;
      }
      {
        mode = "n";
        key = "<C-j>";
        action = "<C-w>j";
        options.silent = true;
      }
      {
        mode = "n";
        key = "<C-k>";
        action = "<C-w>k";
        options.silent = true;
      }
      {
        mode = "n";
        key = "<C-l>";
        action = "<C-w>l";
        options.silent = true;
      }
      {
        mode = "n";
        key = "<Tab>";
        action = ":BufferLineCycleNext<CR>";
        options.silent = true;
      }
      {
        mode = "n";
        key = "<S-Tab>";
        action = ":BufferLineCyclePrev<CR>";
        options.silent = true;
      }
      # TODO: add buffer line mappings
    ];
  };
}
