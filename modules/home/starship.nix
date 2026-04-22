{ config, pkgs, ... }:

{
    programs.starship = {
        enable = true;
        enableFishIntegration = true;
        settings = {
            add_newline = true;
            format = "$directory\n$character";

            character = {
                success_symbol = "[](bold green)";
                error_symbol = "[](bold red)";
            };

            directory = {
                style = "bold cyan";
                truncate_to_repo = false;
            };

            git_branch = {
                format = "[$branch]($style) ";
                style = "purple";
            };
        };
    };
}
