{
  pkgs,
  lib,
  username,
  homeDir,
  ...
}:
{
  home.username = username;
  home.homeDirectory = homeDir;

  imports = [
    ./bash.nix
    ./carapace.nix
    ./fish.nix
    ./helix.nix
    ./nushell.nix
    ./starship.nix
    ./zsh.nix
    ./git.nix
  ];

  home.packages = with pkgs; [
    nushell
    carapace
    starship
    helix
    ripgrep
    cspell
    fish-lsp
    nixd
    nixfmt
    zsh
    fish
    bash
    gitoxide
    git
    bash-language-server
    shfmt
    shellcheck
    nufmt
    skim
    wild
  ];

  home.activation.starship-nu = lib.hm.dag.entryAfter [ "writeBoundary" ] ''
    mkdir -p "$HOME/.local/share/nushell/vendor/autoload"
    ${pkgs.starship}/bin/starship init nu > "$HOME/.local/share/nushell/vendor/autoload/starship.nu"

    mkdir -p "$HOME/.cache/nushell"
    ${pkgs.carapace}/bin/carapace _carapace nushell > "$HOME/.cache/nushell/carapace.nu"
  '';

  home.file.".local/share/nushell/vendor/autoload/carapace.nu" = {
    text = ''
      $env.CARAPACE_BRIDGES = 'zsh,fish,bash,inshellisense' # optional
      source $"($nu.cache-dir | path join carapace.nu)"
    '';
  };

  home.file.".cargo/config.toml" = {
    text = ''
      [unstable]
      codegen-backend = true

      [profile.dev]
      codegen-backend = "cranelift"

      [target.'cfg(all(target_os = "linux", debug-assertions))']
      rustflags = [
        "-C", "link-arg=-fuse-ld=wild"
      ]
    '';
  };

  home.stateVersion = "25.11";

  programs.home-manager.enable = true;
}
