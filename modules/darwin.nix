{
  pkgs,
  lib,
  ...
}: {
  security = lib.mkIf pkgs.stdenv.isDarwin {
    pam.enableSudoTouchIdAuth = true;
  };
}
