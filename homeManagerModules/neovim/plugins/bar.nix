{
  programs.nixvim = {
    keymaps = [
      {
        mode = "n";
        key = "<S-TAB>";
        action = ":BufferLineCyclePrev<CR>";
        options.silent = true;
      }
      {
        mode = "n";
        key = "<TAB>";
        action = ":BufferLineCycleNext<CR>";
        options.silent = true;
      }
    ];

    plugins.bufferline = {
      enable = true;
      settings = {
        options = {
          offsets = [
            {
              filetype = "neo-tree";
              text = "File tree";
              text_align = "left";
            }
          ];
        };
      };
    };
  };
}
