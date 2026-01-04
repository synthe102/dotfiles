{
  programs.nixvim = {
    plugins.git-worktree = {
      enable = true;
      enableTelescope = true;
    };
    keymaps = [
      {
        mode = "n";
        key = "<leader>gw";
        action = ":lua require('telescope').extensions.git_worktree.git_worktree()<CR>";
        options.silent = true;
      }
    ];
  };
}
