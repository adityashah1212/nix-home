{ ... }:
{
  programs.fish = {
    enable = true;
    shellInit = ''
      if test -f $HOME/.cargo/env.fish
        . $HOME/.cargo/env.fish
      end

      if test -f $HOME/.deno/env.fish
        . $HOME/.deno/env.fish
      end
    '';
  };
}
