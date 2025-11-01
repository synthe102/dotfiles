{
  programs.nixvim = {
    opts.completeopt = [
      "menu"
      "menuone"
    ];

    plugins = {
      nvim-autopairs.enable = true;
      blink-cmp = {
        enable = true;
        settings = {
          keymap = {
            preset = "enter";
            "<S-TAB>" = [
              "select_prev"
              "fallback_to_mappings"
            ];
            "<TAB>" = [
              "select_next"
              "fallback_to_mappings"
            ];
          };
        };
      };
    };
  };
}
