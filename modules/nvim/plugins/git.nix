{
  programs.nixvim = {
    enable = true;
    defaultEditor = true;

    viAlias = true;
    vimAlias = true;

    plugins = {
      fugitive.enable = true;
      gitsigns = {
        enable = true;
        signs = {
          add.text = "+";
          change.text = "~";
        };
      };
    };
  };
}
