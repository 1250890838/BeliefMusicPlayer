#include "playback_controller.h"

namespace adapters{
PlaybackController::PlaybackController(application::IPlaybackService* service):m_service(service){
    connect(m_service,&application::IPlaybackService::playbackStateChanged,this,
            [this](application::IPlaybackService::PlaybackState state){
                emit playbackStateChanged(static_cast<PlaybackController::PlaybackState>(state));
            });
    connect(m_service,&application::IPlaybackService::durationChanged,
            this,&PlaybackController::durationChanged);
    connect(m_service,&application::IPlaybackService::positionChanged,
            this,&PlaybackController::positionChanged);
}

void PlaybackController::setShufflePlaybackMode(){
    m_service->setPlaybackMode(application::IPlaybackService::Shuffle);
}

void PlaybackController::setListloopPlaybackMode(){
    m_service->setPlaybackMode(application::IPlaybackService::ListLoop);
}

void PlaybackController::setSingleloopPlaybackMode(){
    m_service->setPlaybackMode(application::IPlaybackService::SingleLoop);
}

void PlaybackController::setSequentialPlaybackMode(){
    m_service->setPlaybackMode(application::IPlaybackService::Sequential);
}

model::SongsModel* PlaybackController::getPlaybackListModel(){
    return &m_playbackListModel;
}

float PlaybackController::volume() const{
    return m_service->volume();
}

void PlaybackController::setVolume(float volume){
    m_service->setVolume(volume);
    emit volumeChanged(volume);
}

qint64 PlaybackController::duration() const{
    return m_service->duration();
}
qint64 PlaybackController::position() const{
    return m_service->position();
}

void PlaybackController::setPosition(qint64 position){
    m_service->setPosition(position);
}

QUrl PlaybackController::source() const{
    return m_service->source();
}

PlaybackController::PlaybackState PlaybackController::playbackState() const {
    return static_cast<PlaybackController::PlaybackState>(m_service->playbackState());
}

void PlaybackController::setSource(const QUrl& media){
    m_service->setSource(media);
    emit sourceChanged(media);
}

void PlaybackController::play(){
    if(!m_service->source().isEmpty()){
        m_service->play();
    }
}

void PlaybackController::pause(){
    m_service->pause();
}

void PlaybackController::stop(){
    m_service->stop();
}
}
