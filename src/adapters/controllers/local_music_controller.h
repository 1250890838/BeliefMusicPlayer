#ifndef LOCALMUSICCONTROLLER_H
#define LOCALMUSICCONTROLLER_H

#include <QObject>
#include "i_local_music_controller.h"
#include "i_local_music_service.h"

namespace adapters{
class LocalMusicController : public ILocalMusicController
{
    Q_OBJECT
public:
    LocalMusicController(application::ILocalMusicService*);
    virtual void getLocalSongs(QString str="") override;
    virtual model::SongsModel* getLocalSongsModel() override;
    virtual void provideNewSong(long long id) override;
private:
    application::ILocalMusicService* m_service;
    model::SongsModel m_localSongsModel;
};
}
#endif // LOCALMUSICCONTROLLER_H
