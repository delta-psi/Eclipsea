{ config, lib, ... }: 

{
  
  xdg.configFile."hypr/tempfile.conf".text = ''
    qs & disown
  '';


}
