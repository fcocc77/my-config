packages=(
    google-chrome-stable
    tree
    net-tools
    wget
    wmctrl
    xdotool
	pciutils # lspci
    ntfs-3g
    ntfsprogs
    rclone
    # unrar
    htop       # monitor de actividad
    bind-utils # para usar 'nslookup' ( resuelve dns a ips )
    youtube-dl # descarga de youtube
    alsa-plugins-pulseaudio # driver de audio
	gparted # administrador de discos
    the_silver_searcher # buscador ag para fzf vim

    ffmpeg
    mpv
    vlc
)

sudo dnf -y install ${packages[@]}
