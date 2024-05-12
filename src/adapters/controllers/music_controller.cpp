#include "music_controller.h"

namespace adapters{

MusicController::MusicController(application::IMusicService* service):
    m_service(service),
    m_selectiveAlbumsModel(&m_service->getSelectiveAlbumsUndelyData()),
    m_playbackListModel(&m_service->getPlaybackListUndelyData()),
    m_albumDetail(&m_service->getPlaylistDetailUndelyData())
{
    connect(m_service,&application::IMusicService::albumInsertionStarted,
            &m_selectiveAlbumsModel,&model::AlbumsModel::startInsertingRow);
    connect(m_service,&application::IMusicService::albumInsertionEnded,
            &m_selectiveAlbumsModel,&model::AlbumsModel::endInsertingRow);
    connect(m_service,&application::IMusicService::songInsertionStarted,
            &m_albumDetail,&model::AlbumDetail::addNewSong);
    connect(m_service,&application::IMusicService::songInsertionEnded,
            &m_albumDetail,&model::AlbumDetail::addNewSongEnd);
    connect(m_service,&application::IMusicService::playSongInsertionStarted,
            &m_playbackListModel,&model::SongsModel::startInsertingRow);
    connect(m_service,&application::IMusicService::playSongInsertionEnded,
            &m_playbackListModel,&model::SongsModel::endInsertingRow);
    connect(m_service,&application::IMusicService::newAlbumName,
            &m_albumDetail,&model::AlbumDetail::setName);
    connect(m_service,&application::IMusicService::newAlbumCoverImgUrl,
            &m_albumDetail,&model::AlbumDetail::setCoverImgUrl);
    connect(m_service,&application::IMusicService::newAlbumDesc,
            &m_albumDetail,&model::AlbumDetail::setDesc);
}

void MusicController::clearSelectiveAlbum(){
    m_selectiveAlbumsModel.clear();
}

void MusicController::getSelectiveAlbum(){
    clearSelectiveAlbum();
    m_service->getSelectiveAlbum();
}

void MusicController::getPlayListDetail(long long id){
    m_albumDetail.clear();
    m_service->getPlaylistDetail(id);
}

void MusicController::getSongUrl(long long id){
    m_service->getSongUrl(id);
}

model::SongsModel* MusicController::getPlaybackListModel(){
    return &m_playbackListModel;
}

model::AlbumsModel* MusicController::getSelectiveAlbumsModel(){
    return &m_selectiveAlbumsModel;
}

model::AlbumDetail* MusicController::getAlbumDetail(){
    return &m_albumDetail;
}

}
