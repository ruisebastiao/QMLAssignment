TEMPLATE = app

#QT += qml quick widgets 3dextras 3dcore 3dquick multimedia sql
QT += qml quick widgets core gui multimedia sql
CONFIG += c++11


SOURCES += main.cpp \
    touchsettings.cpp

RESOURCES += qml.qrc

HEADERS += \
    touchsettings.h \
    qtquickcontrolsapplication.h \
    event.h \
    sqleventmodel.h

OTHER_FILES += \
    *.qml

RC_ICONS = images/appIcon.ico

# Additional import path used to resolve QML modules in Qt Creator's code model
QML_IMPORT_PATH =

# Default rules for deployment.
include(deployment.pri)

HEADERS += \
    touchsettings.h

