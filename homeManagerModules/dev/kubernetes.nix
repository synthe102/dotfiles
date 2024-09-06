{
  pkgs,
  lib,
  config,
  ...
}: {
  options = {
    dev.kubernetes.enable = lib.mkEnableOption "enable k8s tooling";
  };

  config = lib.mkIf config.dev.kubernetes.enable {
    home.packages = with pkgs; [
      kubectx
      fzf
      kubectl
      k9s
      kubeseal
      teleport
      talosctl
      kumactl
      kubernetes-helm
      kubectl-cnpg
      fluxcd
    ];

    programs.zsh = {
      shellAliases = {
        "k" = "kubectl";
        "ks" = "kubeseal";
        "kctx" = "kubectx";
      };
    };
  };
}
