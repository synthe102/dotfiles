{
  programs.nixvim = {
    plugins = {
      bufferline = {
        enable = true;
        diagnostics = "nvim_lsp";
        offsets = [
          {
            filetype = "neo-tree";
            text = "File explorer";
            text_align = "left";
          }
        ];
      };
    };
  };
}
