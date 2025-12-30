{ ... }:
{
  programs.bash = {
    enable = true;
    initExtra = ''
      if [ -d "$HOME/.cargo/bin" ]; then
        export PATH="$HOME/.cargo/bin:$PATH"
      fi
    '';
  };
}
