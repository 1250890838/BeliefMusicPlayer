#include "albumdetail_valueobject.h"

namespace adapters::model{

AlbumDetail::AlbumDetail(QVector<domain::Song>* songs):m_songsModel(songs){
}

QString AlbumDetail::name(){
    return m_name;
}

void AlbumDetail::setName(const QString& name){
    m_name=name;
    emit nameChanged(name);
}

QUrl AlbumDetail::coverImgUrl(){
    return m_coverImgUrl;
}

void AlbumDetail::setCoverImgUrl(const QUrl& url){
    m_coverImgUrl=url;
    emit coverImgUrlChanged(url);
}

QString AlbumDetail::desc(){
    return m_desc;
}

void AlbumDetail::setDesc(const QString& desc){
    m_desc=desc;
    emit descChanged(desc);
}

void AlbumDetail::setCreatorImgUrl(const QUrl& url){
    m_creatorImgUrl=url;
    emit creatorImgUrlChanged(url);
}

void AlbumDetail::setCreatorName(const QString& name){
    m_creatorName=name;
    emit creatorNameChanged(name);
}

SongsModel* AlbumDetail::songsModel(){
    return &m_songsModel;
}

QString AlbumDetail::creatorName(){
    return m_creatorName;
}
QUrl AlbumDetail::creatorImgUrl(){
    return m_creatorImgUrl;
}

void AlbumDetail::addNewSong(int index){
    m_songsModel.startInsertingRow(index);
}

void AlbumDetail::addNewSongEnd(){
    m_songsModel.endInsertingRow();
}

void AlbumDetail::clear(){
    m_name.clear();
    m_desc.clear();
    m_coverImgUrl.clear();
    m_songsModel.clear();
}

}
