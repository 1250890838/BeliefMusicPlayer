#ifndef I_PLAYBACK_SERVICE_H
#define I_PLAYBACK_SERVICE_H
#include "application_export.hpp"
#include <QMediaPlayer>
#include "song.h"
namespace application{
class APPLICATION_EXPORT IPlaybackService : public QMediaPlayer
{
    Q_OBJECT
public:
    enum PlaybackMode
    {
        Shuffle,
        ListLoop,
        SingleLoop,
        Sequential
    };
    virtual ~IPlaybackService() noexcept = default;
    virtual float volume() const = 0;
    virtual void setVolume(float) = 0;
    virtual void setPlaybackList(QVector<domain::Song>*) = 0;
    virtual PlaybackMode playbackMode() = 0;
    virtual void setPlaybackMode(PlaybackMode) = 0;
    virtual void playNextSong() = 0;
    virtual void playPreviousSong() = 0;
    virtual int currentPlayIndex() = 0;
public slots:
    virtual void playNewSong() = 0;
signals:
    void volumeChanged();
    void currentPlayIndexChanged(int);
};
}
#endif // I_PLAYBACK_SERVICE_H
