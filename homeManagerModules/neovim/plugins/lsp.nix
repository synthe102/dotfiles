{
  programs.nixvim = {
    diagnostics = {
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
      lsp-format.enable = true;
      trouble.enable = true;

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
          nil-ls.enable = true;
          gopls.enable = true;
          terraformls.enable = true;
          clangd.enable = true;
          rust-analyzer = {
            enable = true;
            installRustc = false;
            installCargo = false;
          };
          pyright.enable = true;
        };
      };

      none-ls = {
        enable = true;
        enableLspFormat = true;
        sources = {
          formatting.alejandra.enable = true;
          formatting.terraform_fmt.enable = true;
          formatting.terragrunt_fmt.enable = true;
        };
      };
    };
  };
}
