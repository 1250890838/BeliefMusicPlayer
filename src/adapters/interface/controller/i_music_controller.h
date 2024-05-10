#ifndef I_MUSIC_CONTROLLER_H
#define I_MUSIC_CONTROLLER_H
#include <QObject>
#include "adapters_export.hpp"
#include "albums_model.h"
#include "songs_model.h"
#include "albumdetail_valueobject.h"

namespace adapters{
class ADAPTERS_EXPORT IMusicController : public QObject{
    Q_OBJECT
    Q_PROPERTY(model::AlbumsModel * selectiveAlbumsModel READ
                   getSelectiveAlbumsModel CONSTANT)
    Q_PROPERTY(model::SongsModel * playbackListModel READ
                   getPlaybackListModel CONSTANT)
    Q_PROPERTY(model::AlbumDetail* albumDetail READ
                   getAlbumDetail CONSTANT)
public:
    Q_INVOKABLE virtual void getSelectiveAlbum() = 0;
    Q_INVOKABLE virtual void getPlayListDetail(long long id) = 0;
    Q_INVOKABLE virtual void getSongUrl(long long id) = 0;
    virtual model::AlbumsModel* getSelectiveAlbumsModel() = 0;
    virtual model::SongsModel* getPlaybackListModel() = 0;
    virtual model::AlbumDetail* getAlbumDetail() = 0;
public:
    virtual ~IMusicController() noexcept = default;
signals:

};
}
#endif // I_MUSIC_CONTROLLER_H
