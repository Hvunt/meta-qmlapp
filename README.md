This is a Yocto template layer for building QT6+QML based application which uses opengl as backend (it works without X). The version of Yocto is *Scarthgap*.

To build this with raspberry pi (tested on Raspberry Pi 4B) add the following code to the corresponding files.

`conf/local.conf`
```yocto
DISTRO_FEATURES:remove = "X11 wayland"
DISTRO_FEATURES:append = " opengl"

INIT_MANAGER = "systemd"

VIRTUAL-RUNTIME_init_manager = "systemd"
VIRTUAL-RUNTIME_initscripts = "systemd-compat-units"

DISTRO_FEATURES_BACKFILL:remove = "sysvinit"
DISTRO_FEATURES:remove = "sysvinit"
```

Into your core recipe (or `conf/local.conf`)
```yocto
IMAGE_INSTALL:append = " myapp "

# Fonts
IMAGE_INSTALL:append = "\
    ttf-dejavu-sans \
    ttf-dejavu-sans-mono \
    ttf-dejavu-sans-condensed \
    ttf-dejavu-serif \
    ttf-dejavu-serif-condensed \
    ttf-dejavu-common \
"
```

`myapp` recipe will also install systemd service to autorun your application.

