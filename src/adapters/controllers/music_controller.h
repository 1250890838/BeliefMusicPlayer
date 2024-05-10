#ifndef MUSICCONTROLLER_H
#define MUSICCONTROLLER_H

#include <QObject>
#include "i_music_controller.h"
#include "i_music_service.h"
#include "albums_model.h"
#include "songs_model.h"

#include "adapters_export.hpp"

namespace adapters{
class MusicController : public IMusicController
{
public:
    virtual void getSelectiveAlbum() override;
    virtual void getPlayListDetail(long long id) override;
    virtual void getSongUrl(long long id) override;
    virtual model::SongsModel* getPlaybackListModel() override;
    virtual model::AlbumsModel* getSelectiveAlbumsModel() override;
    virtual model::AlbumDetail* getAlbumDetail() override;
    explicit MusicController(application::IMusicService* service);
private:
    void clearSelectiveAlbum();

    application::IMusicService* m_service;
    model::AlbumsModel m_selectiveAlbumsModel;
    model::AlbumDetail m_albumDetail;
    model::SongsModel m_playbackListModel;
};
}
#endif // MUSICCONTROLLER_H
