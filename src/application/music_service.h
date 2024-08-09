#ifndef MUSICSERVICE_H
#define MUSICSERVICE_H

#include <QObject>
#include "i_music_gateway.h"
#include "i_music_service.h"

namespace application{
class MusicService : public IMusicService
{
    Q_OBJECT
public:
    explicit MusicService(IMusicGateway* gateway);
    virtual QVector<domain::Album>& getSelectiveAlbumsUndelyData() override;
    virtual QVector<domain::Song>& getPlaylistDetailUndelyData() override;

    virtual void getSelectiveAlbum() override;
    virtual void getPlaylistDetail(long long) override;
    virtual void clearSelectiveAlbum() override;
    virtual void getSongUrl(long long) override;
private:
    void processSelectieAlbumMetaData(const QVector<domain::Album>& albums);
    void processAlbumDetail(const QString& name,const QString desc,
                             const QUrl& coverImgUrl,const QVector<domain::Song>&,
                                const QString& creatorName,const QUrl& creatorImgUrl);
    void processSongUrl(long long id,const QUrl& url);

    IMusicGateway* m_gateway;

    QVector<domain::Album> m_selectiveAlbums; // 精选歌单
    QVector<domain::Song> m_playListDetail; // 歌单详情
   // QVector<domain::Song> m_playBackList; // 播放列表
signals:

};
}
#endif // MUSICSERVICE_H
