{ pkgs, ... }: {
  programs.neovim = {
    enable = true;
    defaultEditor = true;

    viAlias = true;
    vimAlias = true;
    vimdiffAlias = true;

    extraPackages = with pkgs; [
      wl-clipboard
      ripgrep
    ];

    initLua = ''
      vim.opt.number = true
      vim.opt.relativenumber = true
      vim.opt.termguicolors = true

      vim.opt.shiftwidth = 2
      vim.opt.tabstop = 2
      vim.opt.expandtab = true
      vim.opt.smartindent = true

      vim.g.mapleader = " "

      vim.opt.clipboard = "unnamedplus"
    '';
  };
}
