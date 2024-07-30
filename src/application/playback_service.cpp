#include "playback_service.h"

#include <QRandomGenerator>
namespace application{
PlaybackService::PlaybackService():m_playbackCurrentIndex(-1){
    /*
     * 播放状态改变时
     * 如果加载完毕 直接播放新加载好的歌曲
     * 如果已播放到歌曲的末尾 播放下一首歌曲
    */
    connect(this,&PlaybackService::mediaStatusChanged,this,[this](QMediaPlayer::MediaStatus status){
        if(status==QMediaPlayer::LoadedMedia){
            this->play();
        }
        else if(status==QMediaPlayer::EndOfMedia){
            this->playNextSong();
        }
    });
    this->setAudioOutput(&m_audioOutput);
    this->setPlaybackMode(SingleLoop);
}

float PlaybackService::volume() const{
    return m_audioOutput.volume();
}

void PlaybackService::setVolume(float volume){
    m_audioOutput.setVolume(volume);
}

void PlaybackService::playNewSong(long long id){
    for(int i=m_playBackList->size()-1;i>=0;i--){
        if(m_playBackList->at(i).id==id){
            m_playbackCurrentIndex=i;
        }
    }
    this->setSource(m_playBackList->at(m_playbackCurrentIndex).url);
    emit currentPlayIndexChanged(m_playbackCurrentIndex);
}

void PlaybackService::setPlaybackList(QVector<domain::Song>* songs){
    m_playBackList=songs;
}

void PlaybackService::setPlaybackMode(PlaybackMode playbackMode){
    m_playbackMode=playbackMode;
    if(playbackMode==SingleLoop){
        this->setLoops(QMediaPlayer::Infinite);
    }
    else{
        this->setLoops(QMediaPlayer::Once);
    }
}

PlaybackService::PlaybackMode PlaybackService::playbackMode(){
    return m_playbackMode;
}

int PlaybackService::shuffleNextSongIndex(){
    return QRandomGenerator::global()->bounded(m_playBackList->size()-1);
}

void PlaybackService::playPreviousSong(){
    if(m_playbackMode==Shuffle){
        m_playbackCurrentIndex=shuffleNextSongIndex();
    }
    else if(m_playbackMode==ListLoop){
        m_playbackCurrentIndex--;
        if(m_playbackCurrentIndex<0){
            m_playbackCurrentIndex=m_playBackList->size()-1;
        }
    }
    else if(m_playbackMode==SingleLoop){
    }
    else if(m_playbackMode==Sequential){
        m_playbackCurrentIndex--;
        if(m_playbackCurrentIndex<0){
            m_playbackCurrentIndex=m_playBackList->size()-1;
        }
    }
    this->setSource(m_playBackList->at(m_playbackCurrentIndex).url);
    emit currentPlayIndexChanged(m_playbackCurrentIndex);
}

void PlaybackService::playNextSong(){
    if(m_playbackMode==Shuffle){
        m_playbackCurrentIndex=shuffleNextSongIndex();
    }
    else if(m_playbackMode==ListLoop){
        m_playbackCurrentIndex++;
        if(m_playbackCurrentIndex==m_playBackList->size()){
            m_playbackCurrentIndex=0;
        }
    }
    else if(m_playbackMode==SingleLoop){
    }
    else if(m_playbackMode==Sequential){
        m_playbackCurrentIndex++;
        if(m_playbackCurrentIndex==m_playBackList->size()){
            m_playbackCurrentIndex=0;
        }
    }
    this->setSource(m_playBackList->at(m_playbackCurrentIndex).url);
    emit currentPlayIndexChanged(m_playbackCurrentIndex);
}

int PlaybackService::currentPlayIndex(){
    return m_playbackCurrentIndex;
}
}
