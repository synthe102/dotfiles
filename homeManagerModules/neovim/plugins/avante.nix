{pkgs, ...}: {
  programs.nixvim = {
    extraConfigLua = ''
      require("avante_lib").load()
      require("avante").setup({
        provider = "mistral",
        vendors = {
          mistral = {
            endpoint = "https://codestral.mistral.ai/v1/chat/completions",
            model = "codestral-latest",
            api_key_name = "CODESTRAL_API_KEY",
            parse_curl_args = function(opts, code_opts)
              local api_key = os.getenv(opts.api_key_name)
              local Llm = require("avante.providers")

              return {
                url = opts.endpoint,
                headers = {
                  ["Accept"] = "application/json",
                  ["Content-Type"] = "application/json",
                  ["Authorization"] = "Bearer " .. api_key,
                },
                body = {
                  model = opts.model,
                  messages = Llm.openai.parse_message(code_opts),
                  temperature = 0.7,
                  max_tokens = 8192,
                  stream = true,
                  safe_prompt = false,
                },
              }
            end,
            parse_response_data = function(data_stream, event_state, opts)
              local Llm = require("avante.providers")
              Llm.openai.parse_response(data_stream, event_state, opts)
            end,
          },
        },
      })
    '';
    extraPlugins = with pkgs; [
      vimPlugins.nvim-web-devicons
      vimPlugins.avante-nvim
      {
        plugin = vimPlugins.render-markdown;
        config = ''
          :lua require("render-markdown").setup({file_types = { "markdown", "Avante" }})
        '';
      }
    ];
  };
}
