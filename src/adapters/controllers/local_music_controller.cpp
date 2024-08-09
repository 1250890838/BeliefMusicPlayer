#include "local_music_controller.h"

namespace adapters{
LocalMusicController::LocalMusicController(application::ILocalMusicService* service)
    :m_service(service),
    m_localSongsModel(&m_service->getLocalSongsUndelyData()){
    connect(m_service,&application::ILocalMusicService::songsInsertionStarted,
            &m_localSongsModel,&model::SongsModel::startInsertingRows);
    connect(m_service,&application::ILocalMusicService::songsInsertionEnded,
            &m_localSongsModel,&model::SongsModel::endInsertingRows);
    connect(m_service,&application::ILocalMusicService::songsClear,
            &m_localSongsModel,&model::SongsModel::clear);
}

void LocalMusicController::getLocalSongs(QString name){
    m_service->getMediaItems(name);
}

model::SongsModel* LocalMusicController::getLocalSongsModel(){
    return &m_localSongsModel;
}

void LocalMusicController::provideNewSong(long long id){
    m_service->provideNewLocalSong(id);
}

}

