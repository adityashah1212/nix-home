{ ... }:
{
  programs.zsh = {
    enable = true;
    initContent = ''
      if [ -d "$HOME/.cargo/bin" ]; then
        export PATH="$HOME/.cargo/bin:$PATH"
      fi
    '';
  };
}
