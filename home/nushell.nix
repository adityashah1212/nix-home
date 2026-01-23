{ ... }:
{
  programs.nushell = {
    enable = true;
    extraConfig = ''
      $env.config.buffer_editor = "hx"
      let cargo_bin = ($env.HOME | path join .cargo bin)
      if ($cargo_bin | path exists) and ($cargo_bin not-in $env.PATH) {
        $env.PATH = ($env.PATH | prepend $cargo_bin)
      }

      let deno_bin = ($env.HOME | path join .deno bin)
      if ($deno_bin | path exists) and ($deno_bin not-in $env.PATH) {
        $env.PATH = ($env.PATH | prepend $deno_bin)
      }
    '';
  };
}
