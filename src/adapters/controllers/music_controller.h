#ifndef MUSICCONTROLLER_H
#define MUSICCONTROLLER_H

#include <QObject>
#include "i_music_controller.h"
#include "i_music_service.h"
#include "albums_model.h"
#include "songs_model.h"

#include "adapters_export.hpp"

/*
 * 目前 这个类主要是提供网络歌曲及歌单的获取功能
 * 还有 持有播放列表的数据 ？ 后面可能要把播放列表的数据分离出来
*/
namespace adapters{
class MusicController : public IMusicController
{
public:
    virtual void getSelectiveAlbum() override;
    virtual void getPlayListDetail(long long id) override;
    virtual void getSongUrl(long long id) override;
    virtual model::AlbumsModel* getSelectiveAlbumsModel() override;
    virtual model::AlbumDetail* getAlbumDetail() override;
    explicit MusicController(application::IMusicService* service);
private:
    void clearSelectiveAlbum();

    application::IMusicService* m_service;
    model::AlbumsModel m_selectiveAlbumsModel;
    model::AlbumDetail m_albumDetail;
};
}
#endif // MUSICCONTROLLER_H
