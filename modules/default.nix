{pkgs, ...}: {
  imports = [
    ./user.nix
    ./darwin.nix
  ];

  # Auto upgrade nix package and the daemon service.
  services.nix-daemon.enable = true;
  nix.package = pkgs.nix;

  # Necessary for using flakes on this system.
  nix.settings.experimental-features = "nix-command flakes";

  programs.zsh.enable = true;

  nixpkgs.config.allowUnfree = true;
}
