#-------------------------------------------------
#
# Project created by QtCreator 2012-01-05T20:21:23
#
#-------------------------------------------------

QT       += core gui
#QT       -= gui

TARGET = orientationlock
CONFIG   += console meegotouch
CONFIG   -= app_bundle

TEMPLATE = app

SOURCES += main.cpp

unix:!symbian:!maemo5 {
    target.path = /opt/orientationlock/bin
    INSTALLS += target

    shell.files = populate.sh
    shell.path = /opt/orientationlock/bin
    desktopfile.files = $${TARGET}.desktop
    desktopfile.path = /usr/share/applications
    icon.files = unlocked.png locked_portrait.png locked_landscape.png
    icon.path = /opt/orientationlock/icons

    !isEmpty(desktopfile.path) {
        export(icon.files)
        export(icon.path)
        export(desktopfile.files)
        export(desktopfile.path)
        export(shell.files)
        export(shell.path)
        INSTALLS += icon desktopfile shell
    }
}

OTHER_FILES += \
    qtc_packaging/debian_harmattan/rules \
    qtc_packaging/debian_harmattan/README \
    qtc_packaging/debian_harmattan/manifest.aegis \
    qtc_packaging/debian_harmattan/copyright \
    qtc_packaging/debian_harmattan/control \
    qtc_packaging/debian_harmattan/compat \
    qtc_packaging/debian_harmattan/changelog \
    OrientationLock.desktop \
    qtc_packaging/debian_harmattan/postinst

HEADERS +=
