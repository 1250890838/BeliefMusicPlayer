#include <QGuiApplication>
#include <qobject.h>
#include <QQmlApplicationEngine>
#include <QWKQuick/qwkquickglobal.h>
#include "presentation/dog.h"
#include "dependency_injection.h"

int main(int argc, char *argv[])
{
#if QT_VERSION >= QT_VERSION_CHECK(6, 0, 0)
    qputenv("QT_QUICK_CONTROLS_STYLE", "Basic");
#else
    qputenv("QT_QUICK_CONTROLS_STYLE", "Default");
#endif
    QCoreApplication::setOrganizationName("Belief");
    QCoreApplication::setOrganizationDomain("Belief.com");
    QCoreApplication::setApplicationName("BeliefMusicPlayer");

    { Dog dog; } // 为了链接 presentation
    QGuiApplication::setHighDpiScaleFactorRoundingPolicy(
        Qt::HighDpiScaleFactorRoundingPolicy::PassThrough);
    QGuiApplication app(argc, argv);

    auto* musicService=config::diConfig().create<application::IMusicService*>();
    adapters::IMusicController* musicController=new adapters::MusicController(musicService);
    qmlRegisterSingletonInstance("Belief.controllers", 1, 0, "MusicController",
                                 musicController);

    auto* playbackService=config::diConfig().create<application::IPlaybackService*>();
    adapters::IPlaybackController* playbackController=new adapters::PlaybackController(playbackService);
    qmlRegisterSingletonInstance("Belief.controllers",1,0,"PlaybackController",
                                 playbackController);

    auto* localMusicService=config::diConfig().create<application::ILocalMusicService*>();
    adapters::ILocalMusicController* localMusicController=new adapters::LocalMusicController(localMusicService);
    qmlRegisterSingletonInstance("Belief.controllers",1,0,"LocalMusicController",
                                 localMusicController);

    QObject::connect(musicService,&application::IMusicService::songRequiredFinshed,
                     playbackService,&application::IPlaybackService::onSongRequiredFinished);
    QObject::connect(localMusicService,&application::ILocalMusicService::newLocalSongProvided,
                     playbackService,&application::IPlaybackService::onSongRequiredFinished);


    qmlRegisterSingletonType(QUrl("qrc:/qml/StyleSheet.qml"), "Belief.style", 1, 0, "Style");
    qmlRegisterSingletonType(QUrl("qrc:/qml/IconSheet.qml"), "Belief.icons", 1, 0, "Icons");
    qmlRegisterSingletonType(QUrl("qrc:/qml/FontSheet.qml"), "Belief.fonts", 1, 0, "Fonts");

    QQmlApplicationEngine engine;
    engine.addImportPath("qrc:/qml/modules");
    QWK::registerTypes(&engine);
    const QUrl url(u"qrc:/qml/Main.qml"_qs);
    QObject::connect(&engine, &QQmlApplicationEngine::objectCreationFailed,
        &app, []() { QCoreApplication::exit(-1); },
        Qt::QueuedConnection);
    engine.load(url);

    return app.exec();
}
