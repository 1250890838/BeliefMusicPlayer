#include "playback_service.h"

#include <random>
namespace application{
PlaybackService::PlaybackService():m_playbackCurrentIndex(-1),m_playbackMode(SingleLoop){
    connect(this,&PlaybackService::playbackStateChanged,this,[this](PlaybackState state){
        if(state==QMediaPlayer::StoppedState){
            this->playNextSong();
        }
    });
    this->setAudioOutput(&m_audioOutput);
}

float PlaybackService::volume() const{
    return m_audioOutput.volume();
}

void PlaybackService::setVolume(float volume){
    m_audioOutput.setVolume(volume);
}

void PlaybackService::playNewSong(){
    if(m_playBackList->size()){
        m_playbackCurrentIndex=m_playBackList->size()-1;
        this->stop();
        this->setSource(m_playBackList->at(m_playbackCurrentIndex).url);
        this->play();
    }
}

void PlaybackService::setPlaybackList(QVector<domain::Song>* songs){
    m_playBackList=songs;
}

void PlaybackService::setPlaybackMode(PlaybackMode playbackMode){
    m_playbackMode=playbackMode;
}

int PlaybackService::shuffleNextSongIndex(){
    std::default_random_engine eng;
    std::normal_distribution<double> distrN(
        0,m_playBackList->size()
        );
    return distrN(eng);
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
            m_playbackCurrentIndex=-1;
            return;
        }
    }
    this->setSource(m_playBackList->at(m_playbackCurrentIndex).url);
    this->play();
}

}
