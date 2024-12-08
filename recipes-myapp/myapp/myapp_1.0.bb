LICENSE = "CLOSED"

DEPENDS:append = " qtquickdesigner-components qttools-native"

RDEPENDS:${PN}:append = " packagegroup-qt6-essentials qtquickdesigner-components"

SRC_URI = "\
    file://res/App.qml \
    file://main.cpp \
    file://CMakeLists.txt \
    file://myapp.service \
"
S = "${WORKDIR}"

do_install:append(){
    # There is a trick that qt6 cmake can't use QML deploy script,
    # so, we have to install all necessary things manually
    install -d ${D}${libdir}/res
    cp -r ${S}/res ${D}${libdir}

    install -d ${D}${systemd_system_unitdir}
    install -m 0644 ${S}/myapp.service ${D}${systemd_system_unitdir}
}

SYSTEMD_SERVICE:${PN} = "myapp.service"

FILES:${PN}:append = " \
    ${libdir}/res/App.qml \
    ${systemd_system_unitdir}/myapp.service \
"

inherit qt6-cmake systemd