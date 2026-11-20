
{ pkgs, inputs, ... }:

{
  environment = {
    systemPackages = with pkgs; [
      (zathura.override {
        plugins = [ zathuraPkgs.zathura_pdf_mupdf ];
      })
      # nushell
      wl-clipboard
      smassh
      # overskride
      # vesktop
      # spotube
      # stoat-desktop
      # cava
      wev
      hyprpicker
      playerctl
      # kdePackages.dolphin
      # thunar
      # thunar-volman
      # thunar-archive-plugin
      xfconf
      vial
      xdotool
      vlc
      meowpdf
      spotdl
      python313Packages.spotipyfree
      yt-dlp
      # beets
      rmpc
      # mpd
      mpc
      deno
      ani-cli
      youtube-tui
      bluetui
      wiremix
      wifitui
      spicetify-cli
      rnote
      glow
      leaf-markdown-viewer # or mdfried 
      libnotify
      loaf
      trash-cli
      unicode-character-database
      wlogout
      # prismlauncher
      (pkgs.prismlauncher.override {
        jdks = [ pkgs.jdk25 pkgs.jdk21 pkgs.jdk17 pkgs.jdk8 ];
      })
      inputs.tuido.packages.${system}.default
      inputs.mandible.packages.${system}.default

      linecast 
      # myx
      # alsa-plugins
      lazyrsync
      # matcha 
      dooit # meh
      dooit-extras
      slides
      pomo # or pom
      mpv


      

      sweet-nova
      # sweet # Deprecated because of a dead dependency
      sweet-folders
      candy-icons
      nwg-look
      elegant-sddm
      adw-gtk3
      inputs.matugen.packages.${stdenv.hostPlatform.system}.default
      # inputs.noctalia.packages.${stdenv.hostPlatform.system}.default
      # inputs.caelestia-shell.packages.${stdenv.hostPlatform.system}.with-cli
      awww
      wallust
      quickshell
      qt6.qtdeclarative
      kdePackages.qt5compat
      qt5.qtdeclarative
      kdePackages.qtmultimedia
      kdePackages.qtsvg
      kdePackages.qtvirtualkeyboard
      qt5.qtgraphicaleffects
      kdePackages.qt6ct
      xdg-desktop-portal
      xdg-desktop-portal-wlr
      gsettings-desktop-schemas
      glib
      inputs.terminal-rain.packages.${stdenv.hostPlatform.system}.terminal-rain-lightning
      gtk3

    ];
  };

}
