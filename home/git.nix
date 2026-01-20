{ system, ... }:
let
  credential =
    if system == "x86_64-darwin" || system == "aarch64-darwin" then
      {
        credential.helper = "osxkeychain";
      }
    else
      { };
in
{
  programs.git = {
    enable = true;
    settings = {
      core.editor = "hx";
      commit.cleanup = "scissors";
      init.defaultBranch = "main";
      user.name = "Aditya Shah";
      inherit (credential) credential;
    };
  };
}
