{ pkgs }: {
  deps = [
    pkgs.haskellPackages.daemons
    pkgs.ed
    pkgs.utillinux
    pkgs.vim
    pkgs.q-text-as-data
    pkgs.bashInteractive
    pkgs.nodePackages.bash-language-server
    pkgs.man
  ];
}