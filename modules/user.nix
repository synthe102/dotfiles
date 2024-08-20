{
  user,
  pkgs,
  ...
}: let
  homePath =
    if pkgs.stdenv.isDarwin
    then "/Users/${user.name}"
    else "/home/${user.name}";
in {
  users.users.${user.name} = {
    name = user.name;
    home = homePath;
  };
}
