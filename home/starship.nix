{ ... }:
{
  programs.starship = {
    enable = true;
    settings = {
      format = "\${custom.shell_indicator}$all";
      right_format = "$status$cmd_duration$time";
      status = {
        disabled = false;
        format = "[$symbol$status]($style) ";
        symbol = "✘ ";
      };
      cmd_duration = {
        min_time = 25;
        format = "took [$duration]($style) ";
      };
      time = {
        disabled = false;
        time_format = "%R";
        format = "at [$time]($style) ";
      };
      custom.shell_indicator = {
        # This command detects the shell and outputs the specific icon/text
        command = ''
          case "$STARSHIP_SHELL" in
            "bash") echo "[>]" ;;
            "zsh")  echo "[⚡]"  ;;
            "fish") echo "[🐠]" ;;
            "nu")   echo "[🐘]"   ;;
            *)      echo "$STARSHIP_SHELL" ;;
          esac
        '';
        when = "true"; # Always run the detection
        shell = "bash"; # Use bash to execute the case statement
        format = "[$output]($style) ";
      };
    };
  };
}
