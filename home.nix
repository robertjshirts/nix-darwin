{ config, pkgs, ... }:

let
  sfMonoNerdFontFiles = [
    "SFMonoNerdFont-Bold.otf"
    "SFMonoNerdFont-BoldItalic.otf"
    "SFMonoNerdFont-Heavy.otf"
    "SFMonoNerdFont-HeavyItalic.otf"
    "SFMonoNerdFont-Italic.otf"
    "SFMonoNerdFont-Light.otf"
    "SFMonoNerdFont-LightItalic.otf"
    "SFMonoNerdFont-Medium.otf"
    "SFMonoNerdFont-MediumItalic.otf"
    "SFMonoNerdFont-Regular.otf"
    "SFMonoNerdFont-SemiBold.otf"
    "SFMonoNerdFont-SemiBoldItalic.otf"
  ];
in
{
  home.username = "rshirts";

  home.packages = [
    pkgs.ghostty-bin
    pkgs.httpie
    pkgs.ripgrep
    pkgs.starship
    pkgs.zoxide
  ];

  xdg.configFile."ghostty/config.ghostty".source =
    ./dotfiles/ghostty/config.ghostty;
  xdg.configFile."starship.toml".source = ./dotfiles/starship.toml;

  home.file =
    {
      ".tmux.conf".source = ./dotfiles/tmux/tmux.conf;
    }
    // builtins.listToAttrs (map (fontFile: {
      name = "Library/Fonts/HomeManager/${fontFile}";
      value.source = config.lib.file.mkOutOfStoreSymlink
        "${config.home.homeDirectory}/.config/nix-darwin/dotfiles/fonts/SFMonoNerdFont/${fontFile}";
    }) sfMonoNerdFontFiles);

  programs.zsh = {
    enable = true;
    enableCompletion = true;
    shellAliases = {
      rebuild = "sudo darwin-rebuild switch --flake ~/.config/nix-darwin#Robbies-MacBook-Pro && exec zsh";
      vim = "nvim";
      ls = "ls -a";
    };
    history = {
      append = true;
      extended = true;
      ignoreAllDups = true;
    };
  };

  programs.git = {
    enable = true;
    settings = {
      init.defaultbranch = "main";
      user.name = "Robert Shirts";
      user.email = "robertjshirts@gmail.com";
    };
  };

  programs.zoxide = {
    enable = true;
    enableZshIntegration = true;
    options = [ "--cmd cd" ];
  };

  programs.direnv = {
    enable = true;
    enableZshIntegration = true;
    nix-direnv.enable = true;
  };

  programs.dircolors = {
    enable = true;
    enableZshIntegration = true;
  };

  programs.starship = {
    enable = true;
    enableZshIntegration = true;
    # presets = [ "nerd-font-symbols" ];
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
