{ ... }: {
  imports = [
    ./configs/fish.nix
    ./configs/neovim.nix
  ];

  home.stateVersion = "26.05";
}
