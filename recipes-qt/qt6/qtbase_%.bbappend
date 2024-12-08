PACKAGECONFIG:append = " linuxfb eglfs gbm gles2 kms accessibility "
PACKAGECONFIG:remove = "gl tests examples"

PACKAGECONFIG[eglfs-egldevice] = "-DFEATURE_eglfs_egldevice=ON, -DFEATURE_eglfs_egldevice=OFF"
PACKAGECONFIG:append = " eglfs-egldevice"
EXTRA_OECMAKE += "-DQT_FEATURE_egl=ON -DFEATURE_opengl=ON -DQT_FEATURE_opengles2=ON"

inherit populate_sdk_qt6

do_configure:prepend() {
    cat > ${S}/mkspecs/oe-device-extra.pri <<EOF
QMAKE_LIBS_EGL += -lEGL -ldl -lglib-2.0 -lpthread
QMAKE_LIBS_OPENGL_ES2 += -lGLESv2 -lgsl -lEGL -ldl -lglib-2.0 -lpthread

QMAKE_CFLAGS += -DLINUX=1 -DWL_EGL_PLATFORM
QMAKE_CXXFLAGS += -DLINUX=1 -DWL_EGL_PLATFORM

QT_QPA_DEFAULT_PLATFORM = eglfs
EOF
}
