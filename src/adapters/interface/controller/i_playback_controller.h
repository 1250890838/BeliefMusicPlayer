#ifndef I_PLAYBACK_CONTROLLER_H
#define I_PLAYBACK_CONTROLLER_H
#include <QObject>
#include "adapters_export.hpp"
#include "songs_model.h"

namespace adapters{
class ADAPTERS_EXPORT IPlaybackController : public QObject{
    Q_OBJECT
public:
    enum PlaybackMode
    {
        Shuffle,
        ListLoop,
        SingleLoop,
        Sequential
    };
    Q_ENUM(PlaybackMode)
    Q_PROPERTY(float volume READ volume WRITE setVolume NOTIFY volumeChanged)
    Q_PROPERTY(QUrl source READ source WRITE setSource NOTIFY sourceChanged)
    Q_PROPERTY(PlaybackState playbackState READ playbackState NOTIFY playbackStateChanged)
    Q_PROPERTY(qint64 duration READ duration NOTIFY durationChanged)
    Q_PROPERTY(qint64 position READ position WRITE setPosition NOTIFY positionChanged)
    Q_PROPERTY(PlaybackMode playbackMode READ playbackMode WRITE setPlaybackMode NOTIFY playbackModeChanged)
    Q_PROPERTY(int currentPlayIndex READ currentPlayIndex NOTIFY currentPlayIndexChanged)

public:
    enum PlaybackState
    {
        StoppedState,
        PlayingState,
        PausedState
    };
    Q_ENUM(PlaybackState)
    Q_INVOKABLE virtual void changePlaybackMode() = 0;
    virtual model::SongsModel* getPlaybackListModel() = 0;
    virtual float volume() const = 0;
    virtual void setVolume(float) = 0;
    virtual QUrl source() const = 0;
    virtual void setSource(const QUrl&) = 0;
    virtual qint64 duration() const = 0;
    virtual qint64 position() const = 0;
    virtual void setPosition(qint64) = 0;
    virtual PlaybackMode playbackMode() const = 0;
    virtual void setPlaybackMode(PlaybackMode) = 0;
    virtual PlaybackState playbackState() const = 0;
    virtual int currentPlayIndex() const = 0;
    virtual ~IPlaybackController() noexcept = default;

public Q_SLOTS:
    virtual void play() = 0;
    virtual void pause() = 0;
    virtual void stop() = 0;
    virtual void next() = 0;
    virtual void previous() = 0;

signals:
    void volumeChanged(float);
    void sourceChanged(const QUrl &);
    void playbackStateChanged(PlaybackState newState);
    void durationChanged(qint64);
    void positionChanged(qint64);
    void playbackModeChanged(PlaybackMode);
    void currentPlayIndexChanged(int);
};
}
#endif // I_PLAYBACK_CONTROLLER_H
