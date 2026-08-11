
{ pkgs, lib, ... }: 

let 
  researchGroup = "MARI";
  mariDir = "/Users/MARI"; 
  mariGid = 1500;
  admin = "delta";

  researchers = {
    test = {
      uid = 1501;
      # sshKeys = [
      #   "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIMa5GpCGH6up5jygbM+FddWkhJiB9aRhULRC3n5ktfxT server"
      # ];
    };
    hunter = {
      uid = 1502;
      # sshKeys = [
      #
      # ];
    };
    cameron = {
      uid = 1503;
      # sshKeys = [
      #
      # ];
    };    
    garek = {
      uid = 1504;
    };    
    kayla = {
      uid = 1505;
      # sshKeys = [
      #
      # ];
    };    
    alex = {
      uid = 1506;
      # sshKeys = [
      #
      # ];
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
    groups = {
      ${researchGroup} = {
        gid = mariGid;
        members = [ admin ] ++ (lib.attrNames researchers);
      };
      "com.apple.access_ssh" = {
        gid = 399;
        members = [ admin ] ++ (lib.attrNames researchers);
      }; 
    };
    knownGroups = [ researchGroup "com.apple.access_ssh" ];
    users = lib.mapAttrs mkUser researchers;
    knownUsers = (lib.attrNames researchers);
  };

  services.openssh = {
    enable = true;
    # ports = [ 22 2222 ];
    extraConfig = ''
      Port 2222 

      Match LocalPort 2222 Group ${researchGroup}
        PasswordAuthentication yes 
        KbdInteractiveAuthentication yes
        PubkeyAuthentication yes
        AllowTcpForwarding no 
        X11Forwarding no 
        AllowAgentForwarding no

      # Match LocalPort 22 Group ${researchGroup}
      #   PasswordAuthentication no
      #   PubkeyAuthentication no
    '';
  };

  system.activationScripts = {
    extraActivation.text = ''
      mkdir -p ${mariDir}
      chmod 755 ${mariDir}
    '';
    postActivation.text = ''
      # /usr/bin/dscacheutil -flushcache

      mkdir -p ${mariDir}/share
      chown root:${researchGroup} ${mariDir}/share
      chmod 2770 ${mariDir}/share

      ${lib.concatStringsSep "\n" (lib.mapAttrsToList (name: spec: ''
        mkdir -p ${mariDir}/${name}
        chown ${name}:${researchGroup} ${mariDir}/${name}
        chmod 700 ${mariDir}/${name}
      '') researchers)}
    '';
  };

        # /bin/chmod +a "${admin} allow list,add_file,search,delete,add_subdirectory,delete_child,readattr,writeattr,readextattr,writeextattr,readsecurity,writesecurity,chown,file_inherit,directory_inherit" ${mariDir}/${name}
}


