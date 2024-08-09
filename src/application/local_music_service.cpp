#include "local_music_service.h"

#include <QString>
namespace application {
LocalMusicService::LocalMusicService(ILocalMusicGateway* gateway):m_gateway(gateway){
}

void LocalMusicService::getMediaItems(QString name){
    QVector<domain::Song> songs=m_gateway->getLocalMediaFiles(name);
    for(int i=0;i<songs.length();i++){
        songs[i].id=i;
    }
    m_localSongs.clear();
    emit songsClear();
    emit songsInsertionStarted(0,songs.size()-1);
    m_localSongs.append(songs);
    emit songsInsertionEnded();
}

QVector<domain::Song>& LocalMusicService::getLocalSongsUndelyData(){
    return m_localSongs;
}

void LocalMusicService::provideNewLocalSong(long long id){
    for(const auto& song:m_localSongs){
        if(song.id==id){
            emit newLocalSongProvided(song);
            return;
        }
    }
}

}
