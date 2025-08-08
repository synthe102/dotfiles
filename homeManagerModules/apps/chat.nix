{
  config,
  lib,
  pkgs,
  ...
}: {
  options = {
    chat.enable = lib.mkEnableOption "enable chat apps";
  };
  config = lib.mkIf config.chat.enable {
    home.packages = with pkgs; [
      discord
    ];
  };
}
