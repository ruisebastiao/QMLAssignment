#include <QQmlApplicationEngine>
#include <QGuiApplication>
#include <QWindow>
#include <QQmlContext>
#include <QStandardPaths>
#include <QDir>
#include <QtCore>
#include <QtGui>
#include <QtWidgets>
#include <QtGui/QFontDatabase>
#include <QtGui/QGuiApplication>
#include <QtGui/QOpenGLContext>
#include <QtQuick/QQuickView>
#include <QtQuick/QQuickItem>
#include <QtQml/QQmlContext>
#include "touchsettings.h"
#include <QMediaPlayer>

#include "qtquickcontrolsapplication.h"
#include "sqleventmodel.h"


int main(int argc, char *argv[]){

    QGuiApplication app(argc, argv);

    qmlRegisterType<SqlEventModel>("org.qtproject.examples.calendar", 1, 0, "SqlEventModel");

    QQmlApplicationEngine engine;
    const QStringList musicPaths = QStandardPaths::standardLocations(QStandardPaths::MusicLocation);
    const QUrl musicUrl = QUrl::fromLocalFile(musicPaths.isEmpty() ? QDir::homePath() : musicPaths.first());
    engine.rootContext()->setContextProperty(QStringLiteral("musicUrl"), musicUrl);

    const QStringList arguments = QCoreApplication::arguments();
    const QUrl commandLineUrl = arguments.size() > 1 ? QUrl::fromLocalFile(arguments.at(1)) : QUrl();


    if (qgetenv("QT_QUICK_CONTROLS_1_STYLE").isEmpty()) {
#ifdef QT_STATIC
        // Need a full path to find the style when built statically
        qputenv("QT_QUICK_CONTROLS_1_STYLE", ":/ExtrasImports/QtQuick/Controls/Styles/Flat");
#else
        qputenv("QT_QUICK_CONTROLS_1_STYLE", "Flat");
#endif
    }

    QSurfaceFormat format;
    if (QOpenGLContext::openGLModuleType() == QOpenGLContext::LibGL) {
        format.setVersion(3, 2);
        format.setProfile(QSurfaceFormat::CoreProfile);
    }
    format.setDepthBufferSize(24);
    format.setStencilBufferSize(8);

    TouchSettings touchSettings;

    engine.rootContext()->setContextProperty("touchSettings", &touchSettings);
    engine.rootContext()->setContextProperty(QStringLiteral("url"), commandLineUrl);
    engine.load(QUrl("qrc:/main.qml"));

    QObject* root = engine.rootObjects().value(0);
    if (QWindow *window = qobject_cast<QWindow *>(root))
        window->show();
    else
        return -1;

    return app.exec();

}
