{ antigravity, ... }: {
  imports = [
    ./configs/direnv.nix
    ./configs/git.nix
    ./configs/fish.nix
    ./configs/neovim.nix
  ];

  home.packages = [
    antigravity.packages.x86_64-linux.google-antigravity-cli
  ];

  home.stateVersion = "26.05";
}
