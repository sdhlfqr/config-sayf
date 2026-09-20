{ ... }: {
  imports = [
    ./configs/direnv.nix
    ./configs/git.nix
    ./configs/fish.nix
    ./configs/neovim.nix
  ];

  home.stateVersion = "26.05";
}
