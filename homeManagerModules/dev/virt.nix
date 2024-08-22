{
  pkgs,
  lib,
  config,
  ...
}: {
  options = {
    dev.virt.enable = lib.mkEnableOption "enable virtualization tooling";
  };

  config = lib.mkIf config.dev.virt.enable {
    home.packages = with pkgs; [
      lima
    ];
  };
}
