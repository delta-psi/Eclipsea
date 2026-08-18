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
      hash = "sha256-lOaRTMW7iGkiQ/P3KFnW1hRcsshG6th2BzMHY84/BFM="; 
    };

    subPackages = [ "." ];

    proxyVendor = true;
    postPatch = ''
      rm -rf vendor
    '';

    vendorHash = "sha256-AfhAJplWKjQqBJrlQtW84lrEOiNJLBEQ5UdkCMYk7b4="; 
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
      export ADMINS="test,delta"
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
