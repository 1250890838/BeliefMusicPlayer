#ifndef IMUSICSERVICE_H
#define IMUSICSERVICE_H

#include <QObject>
#include "application_export.hpp"
#include "album.h"
#include "song.h"

namespace application{
class APPLICATION_EXPORT IMusicService : public QObject
{
    Q_OBJECT
public:
    virtual QVector<domain::Song>& getPlaybackListUndelyData() = 0;
    virtual QVector<domain::Album>& getSelectiveAlbumsUndelyData() = 0;
    virtual QVector<domain::Song>& getPlaylistDetailUndelyData() = 0;
    virtual ~IMusicService() noexcept = default;
    virtual void clearSelectiveAlbum() = 0;
    virtual void getSelectiveAlbum() = 0;
    virtual void getPlaylistDetail(long long) = 0;
    virtual void getSongUrl(long long) = 0;

signals:
    void albumInsertionStarted(int index);
    void albumInsertionEnded();
    void playSongInsertionStarted(int index);
    void playSongInsertionEnded();
    void songInsertionStarted(int index);
    void songInsertionEnded();
    void newAlbumName(const QString&);
    void newAlbumCoverImgUrl(const QUrl&);
    void newAlbumDesc(const QString&);
    void playNewSong();
};
}
#endif // IMUSICSERVICE_H
