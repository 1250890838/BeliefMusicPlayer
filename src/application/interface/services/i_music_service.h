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
    void songRequiredFinshed(domain::Song);
    void newAlbumName(const QString&);
    void newAlbumCoverImgUrl(const QUrl&);
    void newAlbumDesc(const QString&);
    void newAlbumCreatorName(const QString&);
    void newAlbumCreatorImgUrl(const QUrl&);
    void songInsertionStarted(int index);
    void songInsertionEnded();
};
}
#endif // IMUSICSERVICE_H
