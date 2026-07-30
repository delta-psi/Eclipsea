
{ inputs, ... }:

{
  nixpkgs = {
    config.allowUnfree = true;
    overlays = [
      inputs.nix-cachyos-kernel.overlays.default
      (final: prev: {
        pnpm_10_29_2 = final.pnpm_10;
      })
    ];
  };
  
  nix = {
    settings = {
      experimental-features = [ 
        "nix-command" 
        "flakes" 
      ];
      substituters = [
        "https://attic.xuyh0120.win/lantian"
        "https://hyprland.cachix.org"
      ];
      extra-substituters = [
        "https://noctalia.cachix.org"
      ];
      trusted-substituters = [
        "https://attic.xuyh0120.win/lantian"
        "https://hyprland.cachix.org"
      ];
      trusted-public-keys = [
        "lantian:EeAUQ+W+6r7EtwnmYjeVwx5kOGEBpjlBfPlzGlTNvHc="
        "hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc="
      ];
      extra-trusted-public-keys = [ 
        "noctalia.cachix.org-1:pCOR47nnMEo5thcxNDtzWpOxNFQsBRglJzxWPp3dkU4=" 
      ];
      trusted-users = [
        "root"
        "@wheel"
      ];
    };
  };

}
