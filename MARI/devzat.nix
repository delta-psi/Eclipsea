{ pkgs, ... }:

let
  # Build Devzat from source if not in your nixpkgs channel
  devzat = pkgs.buildGoModule {
    pname = "devzat";
    version = "latest";

    src = pkgs.fetchFromGitHub {
      owner = "quackduck";
      repo = "devzat";
      rev = "main";
      # Set vendorHash to null or the specific hash if required by your Nix version
      hash = "sha256-o123456789012345678901234567890123456789012="; # Run darwin-rebuild to get actual hash
    };

    vendorHash = null;
  };
in
{
  # 1. Install package into system environment
  environment.systemPackages = [ devzat ];

  # 2. Ensure state directory exists for host keys & devzat data
  system.activationScripts.postActivation.text = ''
    mkdir -p /var/lib/devzat
  '';

  # 3. macOS launchd daemon configuration
  launchd.daemons.devzat = {
    script = ''
      export PORT=2221
      export DATA_DIR=/var/lib/devzat
      cd /var/lib/devzat
      exec ${devzat}/bin/devzat
    '';

    serviceConfig = {
      KeepAlive = true;
      RunAtLoad = true;
      WorkingDirectory = "/var/lib/devzat";
      StandardOutPath = "/var/log/devzat.log";
      StandardErrorPath = "/var/log/devzat-err.log";
    };
  };
}
