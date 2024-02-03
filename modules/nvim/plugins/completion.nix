{
  programs.nixvim = {
    plugins = {
      trouble.enable = true;
      lsp = {
        enable = true;
        keymaps = {
          lspBuf = {
            "<leader>ld" = "definition";
            "<leader>lh" = "hover";
          };
        };

        servers = {
          gopls.enable = true;
          nixd.enable = true;
        };
      };

      nvim-autopairs.enable = true;

      luasnip.enable = true;
      lspkind = {
        enable = true;

        cmp = {
          enable = true;
          menu = {
            nvim_lsp = "[LSP]";
            nvim_api = "[api]";
            path = "[path]";
            luasnip = "[snip]";
          };
        };
      };
      nvim-cmp = {
        enable = true;

        snippet.expand = "luasnip";

        mapping = {
          "<Tab>" = {
            modes = ["i" "s"];
            action = "cmp.mapping.select_next_item()";
          };
          "<S-Tab>" = {
            modes = ["i" "s"];
            action = "cmp.mapping.select_prev_item()";
          };
          "<CR>" = "cmp.mapping.confirm({select = true})";
        };
        sources = [
          {name = "path";}
          {name = "nvim_lsp";}
          {name = "luasnip";}
        ];
      };
    };
  };
}
