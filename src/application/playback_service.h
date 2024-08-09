#ifndef PLAYBACKSERVICE_H
#define PLAYBACKSERVICE_H

#include <QMediaPlayer>
#include <QAudioOutput>

#include "i_playback_service.h"
#include "song.h"

namespace application{
class PlaybackService : public IPlaybackService
{
    Q_OBJECT
public:
    explicit PlaybackService();
    virtual float volume() const override;
    virtual void setPlaybackMode(PlaybackMode) override;
    virtual PlaybackMode playbackMode() override;
public slots:
    void setVolume(float volume) override;
    virtual void onSongRequiredFinished(domain::Song) override;
    virtual void playPreviousSong() override;
    virtual void playNextSong() override;
    virtual int currentPlayIndex() override;
    virtual QVector<domain::Song>* getPlaylistUndelyData() override;
private:
    int shuffleNextSongIndex();
private:
    int m_playbackCurrentIndex;
    PlaybackMode m_playbackMode;
    QAudioOutput m_audioOutput;
    QVector<domain::Song> m_playBackList;
};
}
#endif // PLAYBACKSERVICE_H
