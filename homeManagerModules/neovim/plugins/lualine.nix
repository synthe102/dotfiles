{
  programs.nixvim = {
    plugins.lualine = {
      enable = true;
      globalstatus = true;
      settings.options = {
        section_separators = {
          left = "";
          right = "";
        };
        component_separators = {
          left = "";
          right = "";
        };
      };
    };
  };
}
