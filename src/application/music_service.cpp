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

    /*
     * 先检查播放列表是否已经有了一样的歌曲
     * 有的话播放该首歌曲
     * 没有的话即从网络中获取该歌曲并插入播放列表末端
    */
    for(const auto& song:m_playBackList){
        if(song.id==id){
            emit playNewSong(id);
            return;
        }
    }

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
            emit playNewSong(id);
            break;
        }
    }
}

void MusicService::processAlbumDetail(const QString& name,const QString desc,
                                       const QUrl& coverImgUrl,const QVector<domain::Song>& songs,
                                        const QString& creatorName,const QUrl& creatorImgUrl){

    emit newAlbumName(name);
    emit newAlbumDesc(desc);
    emit newAlbumCoverImgUrl(coverImgUrl);
    emit newAlbumCreatorName(creatorName);
    emit newAlbumCreatorImgUrl(creatorImgUrl);

    for(auto& song:songs){
        emit songInsertionStarted(m_playListDetail.count());
        m_playListDetail.append(song);
        emit songInsertionEnded();
    }
}

}
