#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QFileInfo>
#include <QIcon>
int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);

    app.setWindowIcon(QIcon(":/resources/img/app.ico"));

    QQmlApplicationEngine engine;
    const QUrl url("qrc:/qt/qml/Connections/qml/main.qml");
    QObject::connect(&engine, &QQmlApplicationEngine::objectCreated,
                     &app, [url](QObject *obj, const QUrl &objUrl) {
                         if (!obj && url == objUrl)
                             QCoreApplication::exit(-1);
                     }, Qt::QueuedConnection);

    engine.load(url);
    return app.exec();
}
