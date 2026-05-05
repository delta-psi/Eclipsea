{ config, pkgs, ... }: 

let 
  logoDir = ../../Assets/Logos;
  normalizedLogos = pkgs.runCommand "normalized-logos" {
    nativeBuildInputs = [ pkgs.imagemagick ];
  }''
    mkdir -p $out
    for img in ${logoDir}/*.png; do
      filename=$(basename "$img")
      magick "$img" -resize 512x512 -background none -gravity center -extent 512x512 "$out/$filename"
    done
  '';
in
{

  programs.fastfetch = {
    enable = true;
    settings = {
      logo = {
        type = "kitty";
        source = "";
        preserveAspectRatio = true;
        width = 30;
        height = 15;
        padding = {
          top = 2;
          right = 3;
          left = 3;
        };
      };
      display= {
        separator = "  ";
      };
      modules = [
        "break"
        {
          type = "command";
          key = "  ";
          keyColor = "cyan";
          text = "splash=$(hyprctl splash);echo $splash";
        }
        {
          type = "custom";
          format = "┌──────────────────────────────────────────────┐";
          keyColor = "dim_white";
        }
        {
          type = "os";
          key = "   OS        ";
          format = "  {2}";
          keyColor = "magenta";
        }
        {
          type = "kernel";
          key = "   Kernel    ";
          format = "  {2}"; 
          keyColor = "magenta";
        }
        {
          type = "packages";
          key = "  󰏗 Packages  ";
          format = "  {1}";
          keyColor = "magenta";
        }
        {
          type = "display";
          key = "  󰍹 Display   ";
          format = "  {1}x{2} @ {3}Hz";
          keyColor = "magenta";
        }
        {
          type = "terminal";
          key = "   Terminal  ";
          format = "  {1}";
          keyColor = "magenta";
        }
        {
          type = "wm";
          key = "  󱃅 WM        ";
          format = "  {2}";
          keyColor = "magenta";
        }
        {
          type = "custom";
          format = "└──────────────────────────────────────────────┘";
          keyColor = "dim_white";
        }
        "break"
        {
          type = "title";
          key = "  ";
          format = "{6} {7} {8}";
          keyColor = "cyan";
        }
        {
          type = "custom";
          format = "┌──────────────────────────────────────────────┐";
          keyColor = "dim_white";
        }
        {
          type = "cpu";
          format = "  {1} @ {7}";
          key = "   CPU       ";
          keyColor = "magenta";
        }
        {
          type = "gpu";
          format = "  {1} {2}";
          key = "  󰊴 GPU       ";
          keyColor = "magenta";
        }
        {
          type = "memory";
          key = "  🎟 Memory    ";
          format = "  {1} / {2} ({3})";
          keyColor = "magenta";
        }
        {
          type = "disk";
          format = "  {1} / {2} ({3})";
          key = "   Storage   ";
          folders = "/";
          keyColor = "magenta";
        }
        {
          type = "custom";
          format = "└──────────────────────────────────────────────┘";
          keyColor = "dim_white";
        }
        {
          type = "colors";
          paddingLeft = 2;
          symbol = "circle";
        }
        "break"
      ];
    };
  };

  programs.fish.functions = {
    fastfetch = {
      description = "Fastfetch with random logos";
      body = ''
        set -l logos ${normalizedLogos}/*
        set -l random_logo (random choice $logos)
        ${pkgs.fastfetch}/bin/fastfetch --kitty $random_logo
      '';
    };
  };

}
