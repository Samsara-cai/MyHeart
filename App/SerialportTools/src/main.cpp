#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QFileInfo>
int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);
    QQmlApplicationEngine engine;

    const QUrl url("qrc:/qt/qml/SerialportTools/qml/main.qml");

    engine.addImportPath(QString("G:/MyHeart/build/Desktop_Qt_6_8_0_MSVC2022_64bit-Release/Common/CommonQml"));

    QObject::connect(&engine, &QQmlApplicationEngine::objectCreated,
                     &app, [url](QObject *obj, const QUrl &objUrl) {
                         if (!obj && url == objUrl)
                             QCoreApplication::exit(-1);
                     }, Qt::QueuedConnection);

    engine.load(url);

    return app.exec();
}
