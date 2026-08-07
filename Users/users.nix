
{ config, pkgs, lib, ... }: 

let 
  researchGroup = "MARI";
  mariDir = "/Users/MARI"; 
  mariGid = 1500;
  admin = "delta";

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
    description = "${name} (MARI)";
    uid = spec.uid;
    gid = mariGid;
    isHidden = false;
    createHome = true;
    shell = spec.shell or pkgs.fish;
    openssh.authorizedKeys.keys = spec.sshKeys or [ ];
  };
in
{
  users = {
    groups.${researchGroup} = {
      gid = mariGid;
      members = [ admin ] ++ (lib.attrNames researchers);
    };
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
    chown root:${toString mariGid} ${mariDir}/share
    chmod 2770 ${mariDir}/share

    for user_dir in ${mariDir}/*; do 
      if [ "$user_dir" != "${mariDir}/share" ] && [ -d "$user_dir" ]; then 
        chmod 700 "$user_dir"
      fi 
    done
  '';

}
