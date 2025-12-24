{ ... }:
{
  programs.helix = {
    enable = true;
    settings = {
      theme = "ayu_mirage";
      editor.true-color = true;
    };
    languages.language = [
      {
        name = "fish";
        language-servers = [ "fish-lsp" "cspell" ];
      }
      {
        name = "nu";
        language-servers = [ "nu-lsp" "cspell" ];
        formatter = { command = "nufmt"; args = [ "--stdin" ]; };
      }
      {
        name = "bash";
        language-servers = [ "bash-language-server" "cspell" ];
        formatter = [ "shfmt" ];
      }
    ];

    defaultEditor = true;
  };
}
