{ pkgs, ... }:

let
  sfMonoNerdFont = pkgs.runCommand "sfmono-nerd-font-3.4.0" { } ''
    mkdir -p "$out/share/fonts/opentype"
    cp ${./dotfiles/fonts/SFMonoNerdFont}/*.otf "$out/share/fonts/opentype/"
  '';
in
{
  # Only essential packages should be installed system-wide
  environment.systemPackages = [
    pkgs.neovim
    pkgs.git
  ];

  fonts.packages = [
    sfMonoNerdFont
  ];

  homebrew = {
    enable = true;
    enableZshIntegration = true;

    brews = [
      "tmux"
    ];

    casks = [
      "codex"
      "discord"
    ];

    greedyCasks = true;

    onActivation = {
      autoUpdate = true;
      upgrade = true;
    };
  }; 

  users.users.rshirts.name = "rshirts";
  users.users.rshirts.home = "/Users/rshirts";

  programs.zsh.enable = true; 

  security.pam.services.sudo_local = {
    touchIdAuth = true;
    reattach = true;
  };

  # power.sleep.allowSleepByPowerButton = null;
  power.sleep.computer = 20;

  system.primaryUser = "rshirts";
  system.defaults = {
    NSGlobalDomain = {
      AppleICUForce24HourTime = false;
      AppleInterfaceStyle = "Dark";
      ApplePressAndHoldEnabled = false;
      InitialKeyRepeat = 15;
      KeyRepeat = 2;
      AppleScrollerPagingBehavior = true;
      AppleShowAllExtensions = true;
      AppleShowAllFiles = true;
      NSAutomaticCapitalizationEnabled = false;
      NSAutomaticDashSubstitutionEnabled = false;
      NSAutomaticInlinePredictionEnabled = false;
      NSAutomaticPeriodSubstitutionEnabled = false;
      NSAutomaticQuoteSubstitutionEnabled = false;
      NSAutomaticSpellingCorrectionEnabled = false;
    };
    finder = {
      AppleShowAllExtensions = true;
      AppleShowAllFiles = true;
      FXPreferredViewStyle = "Nlsv";
      NewWindowTarget = "Home";
      _FXSortFoldersFirst = true;
    };
    screencapture = {
      location = "~/Pictures/captures";
      target = "clipboard";
      type = "jpg";
    };
    controlcenter = {
      Bluetooth = true;
    };
    dock = {
      autohide = true;
      mineffect = "scale";
      show-recents = false;
      showhidden = true;
    };
  };

  # Set Git commit hash for darwin-version.
  # system.configurationRevision = self.rev or self.dirtyRev or null;
  nix.enable = false;
  system.stateVersion = 6;
  nixpkgs.hostPlatform = "aarch64-darwin";
}
