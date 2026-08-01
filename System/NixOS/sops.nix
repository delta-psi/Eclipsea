
{ config, ... }:

{
  sops = {
    defaultSopsFile = ../../secrets/secrets.yaml;
    age.keyFile = "/home/delta/.config/sops/age/keys.txt";

    secrets = {
      github_token = {
        owner = "delta";
        mode = "0400";
      };
      "github_ed25519" = {
        owner = "delta";
        mode = "0400";
        path = "/home/delta/.ssh/github_ed25519";
      };
      "mu_key" = {
        owner = "delta";
        mode = "0600";
        path = "${config.users.users.delta.home}/.ssh/mu_key";
      };
    };
  };

}
