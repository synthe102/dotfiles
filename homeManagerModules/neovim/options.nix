{
  programs.nixvim = {
    globals = {
      mapleader = " ";
    };

    opts = {
      relativenumber = true;
      number = true;
      cursorline = true;
      cursorlineopt = "number";

      signcolumn = "yes";
      
      # tabs
      tabstop = 2;
      softtabstop = 2;
      shiftwidth = 2;
      expandtab = true;
      # autoindent = true;
    };
  };
}
