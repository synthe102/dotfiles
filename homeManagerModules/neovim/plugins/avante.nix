{pkgs, ...}: {
  programs.nixvim = {
    plugins.avante = {
      enable = true;
      settings = {
        provider = "mistral";
        vendors = {
          mistral = {
            __inherited_from = "openai";
            api_key_name = "MISTRAL_API_KEY";
            endpoint = "https://api.mistral.ai/v1/";
            model = "mistral-large-latest";
          };
        };
      };
    };
  };
}
