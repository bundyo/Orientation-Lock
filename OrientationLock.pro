#-------------------------------------------------
#
# Project created by QtCreator 2012-01-05T20:21:23
#
#-------------------------------------------------

QT       += core
QT       -= gui

TARGET = orientationlock
CONFIG   += console
CONFIG   -= app_bundle

TEMPLATE = app

SOURCES += main.cpp

unix:!symbian:!maemo5 {
    target.path = /usr/bin
    INSTALLS += target

    desktopfile.files = $${TARGET}.desktop
    desktopfile.path = /usr/share/applications
    icon.files = unlocked.png locked_portrait.png locked_landscape.png current.png
    icon.path = /home/user/.config/OrientationLock

    !isEmpty(desktopfile.path) {
        export(icon.files)
        export(icon.path)
        export(desktopfile.files)
        export(desktopfile.path)
        INSTALLS += icon desktopfile
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
    OrientationLock.desktop

HEADERS +=
