
{ pkgs, lib, ... }: 

let 

  userMap = {
    hunter = {
      keys = [

      ];
    };
    terpy = {
      keys = [

      ];
    };    
    alex = {
      keys = [

      ];
    };    
    kayla = {
      keys = [

      ];
    };    
    garek = {
      keys = [

      ];
    };  
  };

  mkUser = name: spec: {
    inherit name; 
    home = "Users/${name}";
    createHome = true;
    shell = spec.shell or pkgs.zsh;
    openssh.authorizedKeys.keys = spec.keys;
  };
in
{
  users.users = lib.mapAttrs mkUser userMap;
}
