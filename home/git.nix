{ ... }:
{
  programs.git = {
    enable = true;
    settings = {
      core.editor = "hx";
      commit.cleanup = "scissors";
      init.defaultBranch = "main";
    };
  };
}
