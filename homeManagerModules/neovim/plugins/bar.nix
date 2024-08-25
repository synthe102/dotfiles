{
  programs.nixvim = {
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
