{ ... }: {
  programs.git = {
    enable = true;

    includes = [
      { path = "~/.gitconfig.local"; }
    ];

    settings = {
      init.defaultBranch = "main";

      core = {
        autocrlf = "input";
        abbrev = 12;
      };

      transfer.fsckObjects = true;
      fetch.fsckObjects = true;
      receive.fsckObjects = true;

      url."git@github.com:" = {
        insteadOf = "https://github.com";
      };

      color.ui = true;

      pretty = {
        fixes = ''Fixes: %h ("%s")'';
      };

      rebase = {
        autosquash = true;
        updateRefs = true;
      };

      alias = {
        amend = "commit --amend";
        fix = "commit --fixup";
        l = "log --oneline --graph --decorate";
        s = "status";
      };

      log.abbrevCommit = true;
    };
  };
}
