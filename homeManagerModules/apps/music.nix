{
  config,
  lib,
  pkgs,
  ...
}: {
  options = {
    music.enable = lib.mkEnableOption "enable music apps";
  };
  config = lib.mkIf config.music.enable {
    home.packages = with pkgs; [
      spotify
    ];
  };
}
