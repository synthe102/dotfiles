{pkgs, ...}: {
  programs.nixvim = {
    extraPlugins = [
      {
        plugin = pkgs.vimPlugins.precognition-nvim;
        config = ''
          :lua require("precognition").setup({startVisible=false})
        '';
      }
    ];
  };
}
