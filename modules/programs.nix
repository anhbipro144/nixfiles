
{
  # home-manager metadata
  # targets.genericLinux.enable = true;

  # make zsh your shell and load your dotfile
  programs.zsh.enable = true;
  home.file.".zshrc".source = ../dotfiles/.zshrc;

  # git config
  programs.git = {
    enable = true;
    userName = "Neo";
    userEmail = "nbi6731@gmail.com";
  };

  programs.neovim = { enable = true; };
  home.file.".config/nvim"= {
    source = ../nvim;
    recursive = true;
  };

  # wezterm
  programs.wezterm.enable = true;
}
