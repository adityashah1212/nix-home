{ ... }:
{
  programs.nushell = {
    enable = true;
    extraConfig = ''
      $env.config.buffer_editor = "hx"
      let cargo_bin = ($env.HOME | path join .cargo bin)
      if ($cargo_bin | path exists) {
        $env.PATH = ($env.PATH | prepend $cargo_bin)
      }
    '';
  };
}
