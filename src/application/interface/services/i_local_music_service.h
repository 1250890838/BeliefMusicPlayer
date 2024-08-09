#ifndef I_LOCAL_MUSIC_SERVICE_H
#define I_LOCAL_MUSIC_SERVICE_H
#include "application_export.hpp"
#include "song.h"
#include <QObject>

namespace application{
class APPLICATION_EXPORT ILocalMusicService : public QObject
{
    Q_OBJECT
public:
    virtual void getMediaItems(QString) = 0; // 依据字符串内容请求获取本地音频项列表
    virtual QVector<domain::Song>& getLocalSongsUndelyData() = 0;
    virtual void provideNewLocalSong(long long id) = 0;
signals:
    void songsInsertionStarted(int begin,int end);
    void songsInsertionEnded();
    void songsClear();
    void newLocalSongProvided(domain::Song);
};
}
#endif // I_LOCAL_MUSIC_SERVICE_H
