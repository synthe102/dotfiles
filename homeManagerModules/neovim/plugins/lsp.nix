{
  programs.nixvim = {
    diagnostics = {
      virtual_text = true;
    };
    plugins = {
      lsp-format.enable = true;

      lsp = {
        enable = true;

        keymaps = {
          silent = true;

          # lspBuf = {
          #   gd = "definition";
          #   gD = "references";
          #   gt = "type_definition";
          #   gi = "implementation";
          #   K = "hover";
          #   "<F2>" = "rename";
          # };
        };

        servers = {
          nil-ls.enable = true;
          gopls.enable = true;
        };
      };
    };
  };
}
