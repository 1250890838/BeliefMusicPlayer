#ifndef PLAYBACKCONTROLLER_H
#define PLAYBACKCONTROLLER_H

#include <QObject>
#include <i_playback_controller.h>
#include "i_playback_service.h"
#include "songs_model.h"

namespace adapters{
class PlaybackController : public IPlaybackController
{
    Q_OBJECT
public:
    explicit PlaybackController(application::IPlaybackService*);

    virtual model::SongsModel* getPlaybackListModel() override;
    virtual float volume() const override;
    virtual void setVolume(float) override;
    virtual QUrl source() const override;
    virtual void setSource(const QUrl&) override;
    virtual PlaybackState playbackState() const override;
    virtual qint64 duration() const override;
    virtual qint64 position() const override;
    virtual void setPosition(qint64) override;
    virtual void play() override;
    virtual void pause() override;
    virtual void stop() override;
    virtual void next() override;
    virtual void previous() override;
    virtual PlaybackMode playbackMode() const override;
    virtual void setPlaybackMode(PlaybackMode) override;
    virtual void changePlaybackMode() override;
    virtual int currentPlayIndex() const override;
private:
    application::IPlaybackService* m_service;
    model::SongsModel m_playbackListModel;
signals:

};
}
#endif // PLAYBACKCONTROLLER_H
