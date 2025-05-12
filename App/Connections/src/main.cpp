#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QFileInfo>
#include <QIcon>
#include "WindowsEventFilter.h"
int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);

    app.setWindowIcon(QIcon(":/resources/img/app.ico"));

    WindowsEventFilter filter;
    app.installEventFilter(&filter);

    QQmlApplicationEngine engine;
    const QUrl url("qrc:/qt/qml/Connections/qml/main.qml");
    QObject::connect(&engine, &QQmlApplicationEngine::objectCreated,
                     &app, [url,&filter](QObject *obj, const QUrl &objUrl) {
                         if (!obj && url == objUrl){
                             QCoreApplication::exit(-1);
                         }else if (obj) {
                             QWindow *win = qobject_cast<QWindow *>(obj);
                             if (win)
                                 filter.setMainWindow(win);
                         }
                     }, Qt::QueuedConnection);

    engine.load(url);
    return app.exec();
}
