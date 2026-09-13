# config-sayf

Personal system configuration and dotfiles managed with Nix and Home Manager.

## Structure

- `configs/`: Modular configurations (Fish, Git, Neovim, Direnv)
- `default.nix`: Main Home Manager entry point
- `shell.nix`: Nix development shell

## Local Git Configuration

Personal details and machine-specific settings can be placed in `~/.gitconfig.local`:

```ini
[user]
    name = Your Name
    email = your-email@example.com
```
