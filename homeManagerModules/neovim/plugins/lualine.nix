{
  programs.nixvim = {
    plugins.lualine = {
      enable = true;
      globalstatus = true;
      componentSeparators = {
        left = "";
        right = "";
      };
    };
  };
}
