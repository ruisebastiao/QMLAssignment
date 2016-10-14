#include <QQmlApplicationEngine>
#include <QGuiApplication>
#include <QWindow>
#include <QQmlContext>
#include <QStandardPaths>
#include <QDir>
#include <QtCore>
#include <QtGui>
#include <QtWidgets>


int main(int argc, char *argv[]){

    QGuiApplication app(argc, argv);

    QQmlApplicationEngine engine;
    const QStringList musicPaths = QStandardPaths::standardLocations(QStandardPaths::MusicLocation);
    const QUrl musicUrl = QUrl::fromLocalFile(musicPaths.isEmpty() ? QDir::homePath() : musicPaths.first());
    engine.rootContext()->setContextProperty(QStringLiteral("musicUrl"), musicUrl);

    const QStringList arguments = QCoreApplication::arguments();
    const QUrl commandLineUrl = arguments.size() > 1 ? QUrl::fromLocalFile(arguments.at(1)) : QUrl();

    engine.rootContext()->setContextProperty(QStringLiteral("url"), commandLineUrl);
    engine.load(QUrl("qrc:/main.qml"));

    QObject* root = engine.rootObjects().value(0);
    if (QWindow *window = qobject_cast<QWindow *>(root))
        window->show();
    else
        return -1;




    return app.exec();



}
