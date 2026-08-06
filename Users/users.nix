
{ config, pkgs, lib, ... }: 

let 
  researchGroup = "MARI";
  mariDir = "/Users/MARI"; 

  researchers = {
    test = {
      uid = 1501;
      sshKeys = [

      ];
    };
    hunter = {
      uid = 1502;
      sshKeys = [

      ];
    };
    cameron = {
      uid = 1503;
      sshKeys = [

      ];
    };    
    garek = {
      uid = 1504;
    };    
    kayla = {
      uid = 1505;
      sshKeys = [

      ];
    };    
    alex = {
      uid = 1506;
      sshKeys = [

      ];
    };  
  };

  mkUser = name: spec: {
    inherit name; 
    home = mariDir;
    group = researchGroup;
    uid = spec.uid;
    isHidden = true;
    createHome = true;
    shell = spec.shell or pkgs.fish;
    openssh.authorizedKeys.keys = spec.sshKeys or [ ];
  };
in
{
  users = {
    groups.${researchGroup}.gid = 1500;
    users = lib.mapAttrs mkUser researchers;
  };

  services.openssh.extraConfig = ''
    Match Group ${researchGroup}
      PasswordAuthentication yes 
      PubkeyAuthentication yes
      AllowTcpForwarding no 
      X11Forwarding no 
      AllowAgentForwarding no
  '';

  system.activationScripts.postActivation.text = ''
    mkdir -p ${mariDir}
    chown root:wheel ${mariDir}
    chmod 755 ${mariDir}

    mkdir -p ${mariDir}/share
    chown root:${researchGroup} ${mariDir}/share
    chmod 2770 ${mariDir}/share

    for user_dir in ${mariDir}/*; do 
      if [ "$user_dir" != "${mariDir}/share" ] && [ -d "$user_dir" ]; then 
        chmod 700 "$user_dir"
      fi 
    done
  '';

}
