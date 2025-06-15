{pkgs, ...}:

{

  # Enable Home Manager
  programs.home-manager = {
    enable = true; # enables Home Manager
  };

  # Enable Git
  programs.git = { enable = true; };

  # Enable Zsh and Oh My Zsh
  programs.zsh = { enable = true; };

  home.file.".zshrc" = { source = ../dotfiles/.zshrc; };

  # wezterm
  programs.wezterm = { enable = true; };



}
