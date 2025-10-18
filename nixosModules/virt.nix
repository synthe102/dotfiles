{
  pkgs,
  user,
  ...
}: {
  virtualisation.libvirtd = {
    enable = true;
    qemu = {
      package = pkgs.qemu_kvm;
      runAsRoot = true;
      swtpm.enable = true;
    };
  };
  users.users.${user.name}.extraGroups = ["libvirtd"];
}
