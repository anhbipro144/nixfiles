{ pkgs, zenBrowser, ... }:

{
  home.packages = with pkgs; [
    delta
    rustc
    cargo
    git
    wezterm
    zenBrowser
    macchina
    eza
    gnumake
    gcc
  ];
}
