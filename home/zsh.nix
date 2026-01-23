{ ... }:
{
  programs.zsh = {
    enable = true;
    initContent = ''
      if [ -f "$HOME/.cargo/env" ]; then
          . $HOME/.cargo/env
      fi
    '';
  };
}
