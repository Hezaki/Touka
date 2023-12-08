{ pkgs ? import <nixpkgs> {} }:

pkgs.dockerTools.buildImage {
  name = "archlinux";
  tag = "latest";
  created = "now";
  fromImage = pkgs.dockerTools.pullImage {
    imageName = "archlinux";
    imageDigest = "sha256:5af2b0f645075a73bcb19e8c0f24b6b0d86a4305e1a84f9a53f9fd5e7bc0f648";
    finalImageTag = "latest";
    sha256 = "sha256-w2G8S31cio6YB5x6EWdaLhLhAaVKi4YuRhsI2I7FPWs";
    os = "linux";
    arch = "x86_64";
  };

  runAsRoot = ''
    #!${pkgs.runtimeShell}
    echo '
    [options]
    HoldPkg     = pacman glibc
    Architecture = auto

    Color
    NoProgressBar
    VerbosePkgLists
    ParallelDownloads = 5

    SigLevel    = TrustAll Required DatabaseOptional
    LocalFileSigLevel = Optional

    [core]
    Include = /etc/pacman.d/mirrorlist

    [extra]
    Include = /etc/pacman.d/mirrorlist

    [community]
    Include = /etc/pacman.d/mirrorlist

    [multilib]
    Include = /etc/pacman.d/mirrorlist

    [options]
    NoExtract  = usr/share/help/* !usr/share/help/en* !usr/share/help/C/*
    NoExtract  = usr/share/gtk-doc/html/* usr/share/doc/*
    NoExtract  = usr/share/locale/* usr/share/X11/locale/* usr/share/i18n/*
    NoExtract   = !*locale*/en*/* !usr/share/i18n/charmaps/UTF-8.gz !usr/share/*locale*/locale.*
    NoExtract   = !usr/share/*locales/en_?? !usr/share/*locales/i18n* !usr/share/*locales/iso*
    NoExtract   = !usr/share/*locales/trans*
    NoExtract   = !usr/share/X11/locale/C/*
    NoExtract   = !usr/share/X11/locale/compose.dir !usr/share/X11/locale/iso8859-1/*
    NoExtract  = !usr/share/*locales/C !usr/share/*locales/POSIX !usr/share/i18n/charmaps/ANSI_X3.4-1968.gz
    NoExtract  = usr/share/man/* usr/share/info/*
    NoExtract  = usr/share/vim/vim*/lang/*
    ' > /etc/pacman.conf
    mkdir /etc/pacman.d
    echo '
    ## Russia
    Server = http://mirror.kamtv.ru/archlinux/$repo/os/$arch
    Server = https://mirror.kamtv.ru/archlinux/$repo/os/$arch
    Server = http://mirror.kpfu.ru/archlinux/$repo/os/$arch
    Server = https://mirror.kpfu.ru/archlinux/$repo/os/$arch
    Server = http://mirror.lebedinets.ru/archlinux/$repo/os/$arch
    Server = https://mirror.lebedinets.ru/archlinux/$repo/os/$arch
    Server = http://mirror.surf/archlinux/$repo/os/$arch
    Server = https://mirror.surf/archlinux/$repo/os/$arch
    Server = http://mirror.nw-sys.ru/archlinux/$repo/os/$arch
    Server = https://mirror.nw-sys.ru/archlinux/$repo/os/$arch
    Server = http://mirrors.powernet.com.ru/archlinux/$repo/os/$arch
    Server = http://mirror.rol.ru/archlinux/$repo/os/$arch
    Server = https://mirror.rol.ru/archlinux/$repo/os/$arch
    Server = http://mirror.truenetwork.ru/archlinux/$repo/os/$arch
    Server = https://mirror.truenetwork.ru/archlinux/$repo/os/$arch
    Server = https://mirror.yal.sl-chat.ru/archlinux/$repo/os/$arch
    Server = http://mirror.yandex.ru/archlinux/$repo/os/$arch
    Server = https://mirror.yandex.ru/archlinux/$repo/os/$arch
    Server = http://archlinux.zepto.cloud/$repo/os/$arch
    ' > /etc/pacman.d/mirrorlist
    pacman -Syu git --noconfirm
    rm -rf .git
  '';
}
