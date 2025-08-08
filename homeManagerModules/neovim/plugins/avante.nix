{pkgs, ...}: {
  programs.nixvim.plugins = {
    avante = {
      enable = true;
      settings = {
        provider = "mistral";
        providers = {
          mistral = {
            __inherited_from = "openai";
            api_key_name = "MISTRAL_API_KEY";
            endpoint = "https://api.mistral.ai/v1/";
            model = "mistral-large-latest";
          };
        };
      };
    };
    render-markdown = {
      enable = true;
      settings = {
        file_types = ["markdown" "Avante"];
      };
    };
  };
}
