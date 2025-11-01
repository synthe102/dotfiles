{
  programs.nixvim = {
    plugins = {
      nvim-autopairs.enable = true;
      blink-cmp = {
        enable = true;
        settings = {
          completion.documentation.auto_show = true;
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
