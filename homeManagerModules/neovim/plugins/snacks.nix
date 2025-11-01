{
  programs.nixvim = {
    plugins.snacks = {
      enable = true;
      settings = {
        indent.enabled = true;
        bufdelete.enabled = true;
        # picker = {
        #   enabled = true;
        #   sources = {
        #     explorer = {
        #       cmd = "rg";
        #     };
        #   };
        # };
        # explorer = {
        #   enabled = true;
        #   replace_netrw = true;
        #   trash = true;
        # };
        # dashboard = {
        #   example = "github";
        # };
        # statuscolumn.enabled = true;
        # git.enabled = true;
      };
    };
  };
}
