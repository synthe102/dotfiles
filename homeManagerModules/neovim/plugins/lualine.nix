{
  programs.nixvim = {
    plugins.lualine = {
      enable = true;
      globalstatus = true;
      sectionSeparators = {
        left = "";
        right = "";
      };
    };
  };
}
