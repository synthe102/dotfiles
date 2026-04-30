{
  programs.nixvim = {
    diagnostic.settings = {
      virtual_text = true;
    };

    keymaps = [
      {
        mode = "n";
        key = "<leader>lt";
        action = ":Trouble diagnostics<CR>";
        options.silent = true;
      }
    ];

    plugins = {
      trouble.enable = true;

      conform-nvim = {
        enable = true;
        autoInstall = {
          enable = true;
          # `lsp` is a conform pseudo-formatter (delegate to the LSP), not a
          # real binary — tell autoInstall not to look for a package for it.
          overrides.lsp = null;
        };
        settings = {
          formatters_by_ft = {
            nix = [ "alejandra" ];
            terraform = [ "terraform_fmt" ];
            "_" = [ "lsp" ];
          };
          format_on_save = {
            timeout_ms = 2000;
            lsp_format = "fallback";
          };
        };
      };

      lsp = {
        enable = true;

        keymaps = {
          silent = true;

          lspBuf = {
            "<leader>ld" = "definition";
            "<leader>lD" = "references";
            "<leader>lt" = "type_definition";
            "<leader>li" = "implementation";
            "<leader>lh" = "hover";
          };
        };

        servers = {
          nil_ls.enable = true;
          gopls.enable = true;
          terraformls.enable = true;
          clangd.enable = true;
          rust_analyzer = {
            enable = true;
            installRustc = false;
            installCargo = false;
          };
          helm_ls.enable = true;
          svelte.enable = true;
          ts_ls.enable = true;
          dockerls.enable = true;
          zls.enable = true;
          ty.enable = true;
          ruff.enable = true;
        };
      };

    };
  };
}
