
{ config, isDarwin, ... }:

# let 
#   home = (if isDarwin "/Users/delta" else "/home/delta");
# in
{
  sops = {
    defaultSopsFile = ../../secrets/secrets.yaml;
    # age.keyFile = (if isDarwin then "/Users/delta/.config/sops/age/keys.txt" else "/home/delta/.config/sops/age/keys.txt");
    age.keyFile = "${config.users.users.delta.home}/.config/sops/age/keys.txt";

    secrets = {
      github_token = {
        owner = "delta";
        mode = "0400";
      };
      "github_ed25519" = {
        owner = "delta";
        mode = "0400";
        # path = "/home/delta/.ssh/github_ed25519";
        path = "${config.users.users.delta.home}/.ssh/github_ed25519";
      };
      "mu_key" = {
        owner = "delta";
        mode = "0600";
        path = "${config.users.users.delta.home}/.ssh/mu_key";
      };
      "duckdns_token" = { };
    };
  };

}
