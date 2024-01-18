{ config, pkgs, ... }:

{
  # List packages installed in system profile. To search by name, run:
  # $ nix-env -qaP | grep wget

  environment.systemPackages = [ 
    pkgs.vim
    pkgs.openssh
    pkgs.python3
    pkgs.gh
    pkgs.curl
    pkgs.git
    pkgs.wget
    pkgs.tmux
    pkgs.htop
    pkgs.btop
    pkgs.tree
    pkgs.minikube
    pkgs.k9s
    pkgs.azure-cli
    pkgs.awscli2
    pkgs.unzip
    pkgs.zsh
    pkgs.zsh-completions
    pkgs.zsh-autosuggestions
    pkgs.zsh-syntax-highlighting
    pkgs.eza
    pkgs.podman
    pkgs.podman-compose
    pkgs.podman-desktop
    pkgs.nodejs_18
    pkgs.terraform
    pkgs.packer
    pkgs.vagrant
    pkgs.ansible
    pkgs.tfsec
    pkgs.qemu
    pkgs.infracost
    pkgs.tailscale
    pkgs.slack-cli
    pkgs.slack
    pkgs.vscode
    pkgs.iterm2
    pkgs.warp-terminal
    pkgs.raycast
    pkgs.utm
    pkgs.dropbox
    pkgs.spotify
    pkgs.cyberduck
    pkgs.minecraft
  ];

  # Use a custom configuration.nix location.
  # $ darwin-rebuild switch -I darwin-config=$HOME/.config/nixpkgs/darwin/configuration.nix
  # environment.darwinConfig = "$HOME/.config/nixpkgs/darwin/configuration.nix";

  # Auto upgrade nix package and the daemon service.
  services.nix-daemon.enable = true;
  # nix.package = pkgs.nix;

  programs.zsh.enable = true; 
  programs.zsh.enableCompletion = true;
  programs.zsh.enableSyntaxHighlighting = true;

  # Used for backwards compatibility, please read the changelog before changing.
  # $ darwin-rebuild changelog
  system.stateVersion = 4;

  # Hostplatform
  nixpkgs.hostPlatform = "aarch64-darwin";

  # Enable TouchID for sudo
  security.pam.enableSudoTouchIdAuth = true;

  # Setting some defaults
  system.defaults = {
    dock.mru-spaces = false;
    finder.AppleShowAllExtensions = true;
    # NSGlobalDomain.AppleShowAllExtensions = bool;
    finder.ShowPathbar = true;
    finder.ShowStatusbar = true;
    loginwindow.GuestEnabled = false;
    menuExtraClock.ShowDate = 0;
    menuExtraClock.ShowDayOfWeek = bool;
    trackpad.TrackpadRightClick = bool;
  };

  # Enable support for x86_64
  nix.extraOptions = ''
    extra-platforms = x86_64-darwin aarch64-darwin
  '';

  # Enable support for Linux builds
  nix.linux-builder.enable = true;
  nixpkgs.config.allowUnfree = true;
}
