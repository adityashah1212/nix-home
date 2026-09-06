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

  nix = {
    package = pkgs.nix;
    settings = {
      experimental-features = [
        "nix-command"
        "flakes"
      ];
    };
  };

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
    yq-go
    llvmPackages.clang-tools
    yaml-language-server
    tombi
    vscode-json-languageserver
    pyrefly
    typescript-language-server
    youplot
    duckdb
    deno
    dprint
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

  home.file.".config/zed/settings.json" = {
    source = data/zed-settings.jsonc;
  };

  home.stateVersion = "25.11";

  programs.home-manager.enable = true;
}
