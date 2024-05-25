#ifndef IMUSICGATEWAY_H
#define IMUSICGATEWAY_H

#include <QObject>
#include "application_export.hpp"
#include "album.h"
#include "song.h"

namespace application{
class APPLICATION_EXPORT IMusicGateway : public QObject
{
    Q_OBJECT
public:
    virtual ~IMusicGateway() noexcept = default;
    virtual void getSongUrl(long long) = 0;
    virtual void getSelectiveAlbum() = 0;
    virtual void getAlbumDetail(long long) = 0;
signals:
    void getSelectiveAlbumFinshed(const QVector<domain::Album>&);
    void getAlbumDetailFinshed(const QString& name,const QString desc,
                               const QUrl& coverImgUrl,const QVector<domain::Song>&,
                                const QString& creatorName,const QUrl& creatorImgUrl);
    void getSongUrlFinshed(long long id,const QUrl&);
};
}
#endif // IMUSICGATEWAY_H
