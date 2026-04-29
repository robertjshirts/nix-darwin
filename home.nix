{ config, pkgs, ... }: {
  home.username = "rshirts";

  home.packages = [
    pkgs.httpie
    pkgs.ripgrep
    pkgs.zoxide
  ];

  programs.zsh = {
    enable = true;
    enableCompletion = true;
    shellAliases = {
      rebuild = "sudo darwin-rebuilt switch --flake ~/.config/nix-darwin#Robbies-Macbook-Pro";
      ls = "ls -a";
    };
    history = {
      append = true;
      extended = true;
      ignoreAllDups = true;
    };
  };

  programs.zoxide = {
    enable = true;
    enableZshIntegration = true;
    options = [ "--cmd cd" ];
  };

  # This value determines the Home Manager release that your
  # configuration is compatible with. This helps avoid breakage
  # when a new Home Manager release introduces backwards
  # incompatible changes.
  #
  # You can update Home Manager without changing this value. See
  # the Home Manager release notes for a list of state version
  # changes in each release.
  home.stateVersion = "25.11";
  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
