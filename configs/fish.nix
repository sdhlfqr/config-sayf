{ ... }: {
  programs.fish = {
    enable = true;

    interactiveShellInit = ''
      set fish_greeting # Disable greeting

      function _git_branch_name
        echo (command git symbolic-ref HEAD 2> /dev/null | sed -e 's|^refs/heads/||')
      end

      function _is_git_dirty
        set -l show_untracked (git config --bool bash.showUntrackedFiles)
        set -l untracked
        if [ "$theme_display_git_untracked" = 'no' -o "$show_untracked" = 'false' ]
          set untracked '--untracked-files=no'
        end
        echo (command git status -s --ignore-submodules=dirty $untracked 2> /dev/null)
      end

      function fish_prompt
        set -l last_status $status
        set -l cyan (set_color -o cyan)
        set -l yellow (set_color -o yellow)
        set -l red (set_color -o red)
        set -l blue (set_color -o blue)
        set -l green (set_color -o green)
        set -l magenta (set_color -o magenta)
        set -l normal (set_color normal)

        # Success/Failure Arrow
        if test $last_status = 0
            set arrow "$green➜ "
        else
            set arrow "$red➜ "
        end

        # Nix Shell
        set -l nix_info ""
        if set -q IN_NIX_SHELL
            if set -q name; and test -n "$name"
                set -l clean_name (string replace -r -- '-env$' "" "$name")
                set nix_info "$magenta($clean_name) "
            else
                set nix_info "$magenta(nix) "
            end
        end

        # Directory
        set -l cwd $cyan(basename (prompt_pwd))

        # Git
        if [ (_git_branch_name) ]
          set -l git_branch $red(_git_branch_name)
          set git_info "$blue git:($git_branch$blue)"

          if [ (_is_git_dirty) ]
            set -l dirty "$yellow ✗"
            set git_info "$git_info$dirty"
          end
        end

        # Title
        function fish_title
            basename (pwd)
        end

        # Output
        echo -n -s $arrow $nix_info $cwd $git_info $normal ' '
      end
    '';
  };
}
