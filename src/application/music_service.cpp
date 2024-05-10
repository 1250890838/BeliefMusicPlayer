#include "music_service.h"

namespace application{
MusicService::MusicService(IMusicGateway* gateway)
    : m_gateway(gateway){
    connect(m_gateway,&IMusicGateway::getSelectiveAlbumFinshed,this,&MusicService::processSelectieAlbumMetaData);
    connect(m_gateway,&IMusicGateway::getAlbumDetailFinshed,this,&MusicService::processAlbumDetail);
    connect(m_gateway,&IMusicGateway::getSongUrlFinshed,this,&MusicService::processSongUrl);
}

QVector<domain::Song>& MusicService::getPlaybackListUndelyData(){
    return m_playBackList;
}

QVector<domain::Album>& MusicService::getSelectiveAlbumsUndelyData(){
    return m_selectiveAlbums;
}

QVector<domain::Song>& MusicService::getPlaylistDetailUndelyData(){
    return m_playListDetail;
}

void MusicService::getSelectiveAlbum(){
    m_gateway->getSelectiveAlbum();
}

void MusicService::getPlaylistDetail(long long id){
    m_gateway->getAlbumDetail(id);
}

void MusicService::getSongUrl(long long id){
    m_gateway->getSongUrl(id);
}

void MusicService::clearSelectiveAlbum(){
    m_selectiveAlbums.clear();
}

void MusicService::processSelectieAlbumMetaData(const QVector<domain::Album>& albums){
    for(auto& album:albums){
        emit albumInsertionStarted(m_selectiveAlbums.size());
        m_selectiveAlbums.append(album);
        emit albumInsertionEnded();
    }
}

void MusicService::processSongUrl(long long id,const QUrl& url){
    domain::Song temp;
    for(const auto& song:m_playListDetail){
        if(song.id==id){
            emit playSongInsertionStarted(m_playBackList.count());
            temp=song;
            temp.url=url;
            m_playBackList.append(temp);
            emit playSongInsertionEnded();
            emit playNewSong();
            break;
        }
    }
}

void MusicService::processAlbumDetail(const QString& name,const QString desc,
                                       const QUrl& coverImgUrl,const QVector<domain::Song>& songs){

    emit newAlbumName(name);
    emit newAlbumDesc(desc);
    emit newAlbumCoverImgUrl(coverImgUrl);

    for(auto& song:songs){
        emit songInsertionStarted(m_playListDetail.count());
        m_playListDetail.append(song);
        emit songInsertionEnded();
    }
}

}
