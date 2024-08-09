#ifndef LOCALMUSICSERVICE_H
#define LOCALMUSICSERVICE_H

#include <QObject>
#include "i_local_music_service.h"
#include "i_local_music_gateway.h"

namespace application {
class LocalMusicService : public ILocalMusicService
{
public:
    LocalMusicService(ILocalMusicGateway*);
    void getMediaItems(QString) override;
    virtual QVector<domain::Song>& getLocalSongsUndelyData() override;
    virtual void provideNewLocalSong(long long id) override;
private:
    ILocalMusicGateway* m_gateway;
    QVector<domain::Song> m_localSongs;
};
}
#endif // LOCALMUSICSERVICE_H
