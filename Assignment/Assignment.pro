TEMPLATE = app

QT += qml quick \
    widgets

CONFIG += c++11


SOURCES += main.cpp

DISTFILES += \
    Content.qml \
    SettingsIcon.qml

RESOURCES += qml.qrc

RC_ICONS = images/appIcon.ico

# Additional import path used to resolve QML modules in Qt Creator's code model
QML_IMPORT_PATH =

# Default rules for deployment.
include(deployment.pri)

HEADERS +=
