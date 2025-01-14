{pkgs, ...}: {
  programs.nixvim = {
    extraConfigLua = ''
      require("avante_lib").load()
      require("avante").setup({
        provider = "mistral",
        auto_suggestions_provider = "mistral",
        behaviour = {
          auto_suggestions = true,
        },
        vendors = {
          mistral = {
            __inherited_from = "openai",
            api_key_name = "CODESTRAL_API_KEY",
            endpoint = "https://api.mistral.ai/v1",
            model = "codestral-latest",
          },
        },
      })
    '';
    extraPlugins = with pkgs; [
      vimPlugins.nvim-web-devicons
      vimPlugins.avante-nvim
      {
        plugin = vimPlugins.render-markdown-nvim;
        config = ''
          :lua require("render-markdown").setup({file_types = { "markdown", "Avante" }})
        '';
      }
    ];
  };
}
