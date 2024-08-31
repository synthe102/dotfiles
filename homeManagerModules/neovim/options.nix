{
  programs.nixvim = {
    globals = {
      mapleader = " ";
    };

    clipboard = {
      register = "unnamedplus";
    };

    opts = {
      relativenumber = true;
      number = true;
      cursorline = true;
      cursorlineopt = "number";

      signcolumn = "yes";

      # misc
      swapfile = false;
      undofile = true;
      incsearch = true;
      ignorecase = true;
      smartcase = true;
      updatetime = 100;

      # tabs
      tabstop = 2;
      softtabstop = 2;
      shiftwidth = 2;
      expandtab = true;
    };
  };
}
