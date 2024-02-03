{
  programs.nixvim = {
    plugins = {
      lualine = {
        enable = true;
        ignoreFocus = ["neo-tree"];
        componentSeparators = {
          left = "";
          right = "";
        };
        sectionSeparators = {
          left = "";
          right = "";
        };
      };
    };
  };
}
