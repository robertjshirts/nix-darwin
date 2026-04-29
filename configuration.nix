{ pkgs, ... }: {
  # Only essential packages should be installed system-wide
  environment.systemPackages = [
    pkgs.vim
    pkgs.git
  ];

  # homebrew.enable = true;
  # homebrew.enableZshIntegration = true;

  users.users.rshirts.name = "rshirts";
  users.users.rshirts.home = "/Users/rshirts";

  programs.zsh.enable = true; 

  # power.sleep.allowSleepByPowerButton = null;
  power.sleep.computer = 20;

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
      NSAutomaticPredictionEnabled = false;
      NSAutomaticPeriodSubstitutionEnabled = false;
      NSAutomaticQuoteSubstitutionEnabled = false;
      NSAutomaticSpellingCorrectionEnabled = false;
    };
    controlcenter = {
      Bluetooth = 18;
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
