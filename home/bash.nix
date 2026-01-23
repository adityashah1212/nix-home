{ ... }:
{
  programs.bash = {
    enable = true;
    initExtra = ''
      if [ -f "$HOME/.cargo/env" ]; then
          . $HOME/.cargo/env
      fi
    '';
  };
}
