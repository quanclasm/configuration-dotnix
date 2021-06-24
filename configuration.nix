# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  imports = [ ./hardware-configuration.nix ];

  # EFI Boot Loader:
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.kernelParams = ["ipv6.disable=1"];
    
  # Timezone:
  time.timeZone = "America/Chicago";

  # Networking:
  networking = {
    hostName = "craptop"; 
    nameservers = [ "1.1.1.1" "1.0.0.1" ];
    enableIPv6 = false;
    firewall.enable = true;
    enableB43Firmware = true;
    firewall.allowPing = false;
    networkmanager.enable = true;
  };

  # Internationalisation:
  i18n = {  
    defaultLocale = "en_US.UTF-8";
  };
  
  # Console:
  console = {
    font = "Lat2-Terminus16";
    keyMap = "us";
  };
  
  # Enable CUPS to print documents.
  services.printing = {
    enable = true;
    drivers = with pkgs; [ epson-escpr ];
  };
  
  # Enable sound.
  sound = {
    enable = true;
    mediaKeys.enable = true;
  };
  
  # Pulseaudio:
  hardware.pulseaudio = {
    enable = true;
  };

  # X11:
  services.xserver = {
    enable = true;
    libinput.enable = true;
    displayManager.sddm.enable = true;
    desktopManager.plasma5.enable = true;
  };

  # Define a user:
  users.users.madelyn = {
    createHome = true;
    isNormalUser = true;
    home = "/home/madelyn";
    extraGroups = [ "wheel" "storage" "power" "video" "adb" "networkmanager" ]; # Enable ‘sudo’ for the user.
  };
  
  # Auto optimize Store:
  nix.autoOptimiseStore = true;

  # Auto upgrade:
  system.autoUpgrade = {
    enable = true;
    allowReboot = false;
  };

  # Allow un-free:
  nixpkgs.config.allowUnfree = true;
  
  # System Packages:
  environment.systemPackages = with pkgs; [
    # Console:
    tlp
    bash
    file
    lsof
    nano
    wget
    curl
    p7zip
    unzip
    unrar
    gnupg
    man-db
    neofetch
    thermald
    adb-sync
    man-pages
    xorg.xkill
    xorg.xrandr
    xorg.xrandr
    xorg.xmodmap
    # Development:
    git
    jdk
    kate
    zeal
    conda
    maven
    gradle
    groovy
    docker
    rustup
    kdevelop
    vscodium
    smartgithg
    android-studio
    jetbrains.idea-community
    jetbrains.pycharm-community
    # Internet:
    firefox
    tdesktop
    qbittorrent
    konversation
    # Games
    steam
    lutris
    discord
    # Graphics:
    krita
    gwenview
    spectacle
    kcolorchooser
    # Office:
    okular
    qownnotes
    thunderbird
    libreoffice
    # Education:
    anki
    tagainijisho
    # Multimedia:
    vlc
    cantata
    obs-studio
    # Accesories:
    ark
    kcalc
    keepassxc
    # System:
    dolphin
    konsole
    ksysguard
    ksystemlog
    # Theming:
    arc-theme
    latte-dock
    arc-kde-theme
    # Security:
    clamav
    openvpn
    bleachbit
    chkrootkit
  ];

  # GNUPG:
  programs.gnupg.agent = {
    enable = true;
  };
  
  # Clamav:
  services.clamav = {
    daemon.enable = true;
    updater.enable = true;
    updater.frequency = 10;
  };
 
  # Thermald:
  services.thermald.enable = true;
  
  # TLP:
  services.tlp = {
    enable = true;
    settings = {
      SATA_LINKPWR_ON_BAT = "low_power";
      CPU_SCALING_GOVERNOR_ON_AC = "powersave";
      CPU_SCALING_GOVERNOR_ON_BAT = "powersave";
    };  
  };
  
  # Power Management:
  powerManagement.enable = true;
  
  # Docker:
  virtualisation.docker.enable = true;
  
  # Steam:
  programs.steam.enable = true;
  
  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "21.05"; # Did you read the comment?

}

