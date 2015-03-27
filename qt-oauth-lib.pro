QT       += webkit

greaterThan(QT_MAJOR_VERSION, 4): QT += widgets webkitwidgets

TARGET = qt-oauth-lib
TEMPLATE = lib
CONFIG += staticlib

SOURCES += oauth2.cpp \
    logindialog.cpp

HEADERS += oauth2.h \
    logindialog.h
unix:!symbian {
    maemo5 {
        target.path = /opt/usr/lib
    } else {
        target.path = /usr/lib
    }
    INSTALLS += target
}

FORMS += \
    logindialog.ui


