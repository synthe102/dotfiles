{
  programs.nixvim = {
    keymaps = [
      {
        mode = "n";
        key = "<leader>cc";
        action = ":CodeCompanionChat<CR>";
        options.silent = true;
      }
    ];
    plugins = {
      codecompanion = {
        enable = true;
        settings = {
          display = {
            chat = {
              window = {
                position = "right";
              };
            };
          };
          adapters = {
            acp = {
              vibe = {
                __raw = ''
                  function()
                    local helpers = require("codecompanion.adapters.acp.helpers")
                    return {
                      name = "vibe",
                      formatted_name = "Vibe",
                      type = "acp",
                      roles = {
                        llm = "assistant",
                        user = "user",
                      },
                      opts = {
                        vision = true,
                      },
                      commands = {
                        default = {
                          "acp_agent",
                        },
                      },
                      defaults = {
                        mcpServers = {},
                        timeout = 20000, -- 20 seconds
                      },
                      env = {
                        MISTRAL_API_KEY= "MISTRAL_API_KEY",
                      },
                      parameters = {
                        protocolVersion = 1,
                        clientCapabilities = {
                          fs = { readTextFile = true, writeTextFile = true },
                        },
                        clientInfo = {
                          name = "CodeCompanion.nvim",
                          version = "1.0.0",
                        },
                      },
                      handlers = {
                        setup = function(self)
                          return true
                        end,

                        form_messages = function(self, messages, capabilities)
                          return helpers.form_messages(self, messages, capabilities)
                        end,

                        on_exit = function(self, code) end,
                      },
                    }
                  end,
                '';
              };
            };
          };
          strategies = {
            agent = {
              adapter = "vibe";
              model = "devstral-latest";
            };
            chat = {
              adapter = "vibe";
              model = "devstral-latest";
            };
            inline = {
              adapter = "vibe";
              model = "devstral-latest";
            };
          };
        };
      };
    };
  };
}
