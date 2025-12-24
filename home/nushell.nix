{ ... }:
{
  programs.nushell = {
    enable = true;
    extraConfig = ''
      $env.config.buffer_editor = "hx"
    '';
  };
}
