{
  programs.nixvim = {
    enable = true;
    defaultEditor = true;

    viAlias = true;
    vimAlias = true;

    globals = {
      mapleader = " ";
    };

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
    };

    plugins = {
      fugitive.enable = true;
    };

    colorschemes.catppuccin = {
      enable = true;
      flavour = "mocha";
    };
  };
}
