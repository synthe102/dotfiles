{
  programs.nixvim = {
    options = {
      relativenumber = true;
      number = true;
      mouse = "a";

      tabstop = 2;
      softtabstop = 2;
      shiftwidth = 2;
      expandtab = true;

      termguicolors = true;
      cursorline = true;
      cursorlineopt = "number";
      signcolumn = "yes";
    };
  };
}
