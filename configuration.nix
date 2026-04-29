{ pkgs, ... }: {
  # List packages installed in system profile. 
  environment.systemPackages = [
    pkgs.vim
    pkgs.git
  ];

  # homebrew.enable = true;
  # homebrew.enableZshIntegration = true;


  programs.zsh.enable = true; 
  programs.zsh.enableAutosuggestions = true;

  # power.sleep.allowSleepByPowerButton = null;
  power.sleep.computer = 20;

  # Set Git commit hash for darwin-version.
  # system.configurationRevision = self.rev or self.dirtyRev or null;
  nix.enable = false;
  system.stateVersion = 6;
  nixpkgs.hostPlatform = "aarch64-darwin";
}
