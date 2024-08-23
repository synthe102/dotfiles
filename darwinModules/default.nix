{...}: {
  services.nix-daemon.enable = true;
  security = {
    pam.enableSudoTouchIdAuth = true;
  };
}
