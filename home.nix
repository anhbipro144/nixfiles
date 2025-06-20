
{
  # Home Manager needs a bit of information about you and the paths it should manage.
  # home.username = "neo";
  # home.homeDirectory = "/home/neo";
  #
  home.username = "neo";
  home.homeDirectory = "/home/neo";
  home.stateVersion = "25.05";
  # home.stateVersion = "25.05"; # Please read the comment before changing.
  # targets.genericLinux.enable = true;
  # This value determines the Home Manager release that your configuration is
  # compatible with. This helps avoid breakage when a new Home Manager release
  # introduces backwards incompatible changes.
  #
  # You should not change this value, even if you update Home Manager. If you do
  # want to update the value, then make sure to first check the Home Manager
  # release notes.

  imports = [ ./modules/packages.nix ./modules/programs.nix ];

  # The home.packages option allows you to install Nix packages into your
  # environment.
  # home.packages = with pkgs; [
  #   git
  #   delta
  #   rustc
  #   cargo 
  # ];

  # 1) Add Zsh to /etc/shells (requires sudo)
  # home.activation.addZshToEtcShells = lib.mkAfter ''
  #   if ! grep -Fxq "${zshPath}" /etc/shells; then
  #     echo "${zshPath}" | sudo tee -a /etc/shells
  #   fi
  # '';
  #
  # # 2) Change your login shell to Zsh
  # home.activation.setZshAsLoginShell = lib.mkAfter ''
  #   if [ "$SHELL" != "${zshPath}" ]; then
  #     chsh -s "${zshPath}" "${config.home.username}"
  #   fi
  # '';

  # Home Manager is pretty good at managing dotfiles. The primary way to manage
  # plain files is through 'home.file'.
  # home.file = {
  # # Building this configuration will create a copy of 'dotfiles/screenrc' in
  # # the Nix store. Activating the configuration will then make '~/.screenrc' a
  # # symlink to the Nix store copy.
  # ".screenrc".source = dotfiles/screenrc;

  # # You can also set the file content immediately.
  # ".gradle/gradle.properties".text = ''
  #   org.gradle.console=verbose
  #   org.gradle.daemon.idletimeout=3600000
  # '';
  # };

  # Home Manager can also manage your environment variables through
  # 'home.sessionVariables'. These will be explicitly sourced when using a
  # shell provided by Home Manager. If you don't want to manage your shell
  # through Home Manager then you have to manually source 'hm-session-vars.sh'
  # located at either
  #
  #  ~/.nix-profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  ~/.local/state/nix/profiles/profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  /etc/profiles/per-user/neo/etc/profile.d/hm-session-vars.sh
  #
  # home.sessionVariables = {
  # EDITOR = "emacs";
  # };

  # Let Home Manager install and manage itself.
  # programs.rust = {
  #   enable = true;          # installs rustc and cargo
  #   package = pkgs.rustup;      # optional: use rustup for nightly toolchains
  # };

  # programs.home-manager = {
  #   enable = true; # enables Home Manager
  # };
}
