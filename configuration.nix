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

  # Set Git commit hash for darwin-version.
  # system.configurationRevision = self.rev or self.dirtyRev or null;
  nix.enable = false;
  system.stateVersion = 6;
  nixpkgs.hostPlatform = "aarch64-darwin";
}
