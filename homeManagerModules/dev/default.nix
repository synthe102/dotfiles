{
  lib,
  config,
  pkgs,
  ...
}: {
  imports = [
    ./kubernetes.nix
    ./git.nix
    ./virt.nix
    ./iac.nix
  ];

  options = {
    dev.enable = lib.mkEnableOption "enable neovim";
  };

  config = lib.mkIf config.dev.enable {
    dev = {
      git.enable = lib.mkDefault true;
      kubernetes.enable = lib.mkDefault true;
      virt.enable = lib.mkDefault true;
      iac.enable = lib.mkDefault true;
    };

    programs.direnv = {
      enable = true;
      enableZshIntegration = true;
      nix-direnv.enable = true;
    };
    home.packages = with pkgs; [
      gnumake
      bazel_7
      docker-client
      docker-credential-helpers
      rustup
      alejandra
      google-cloud-sdk
      unzip
      btop
    ];
  };
}
