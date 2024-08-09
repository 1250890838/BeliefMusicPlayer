#include "songs_model.h"

#include <QVector>
#include <QModelIndex>

namespace adapters::model{

QHash<int, QByteArray> SongsModel::roleNames() const{
    QHash<int, QByteArray> roles;
    roles[IdRole] = "id";
    roles[AlRole] = "album";
    roles[ArRole] = "artists";
    roles[DtRole] = "duration";
    roles[UrlRole] = "url";
    roles[NameRole] = "name";
    roles[AlPicUrlRole] = "picUrl";
    roles[FileSizeRole] = "fileSize";
    return roles;
}

SongsModel::SongsModel(QVector<domain::Song>* songs):m_data(songs){
}

int SongsModel::rowCount(const QModelIndex & parent) const{
    Q_UNUSED(parent);
    return m_data->count();
}

QVariant SongsModel::data(const QModelIndex & index, int role) const{
    if (index.row() < 0 || index.row() >= m_data->count())
        return QVariant();
    const domain::Song& song=m_data->at(index.row());
    switch (role) {
    case IdRole:
        return QVariant::fromValue(song.id);
        break;
    case AlRole:
        return QVariant::fromValue(song.album);
    case ArRole:
        return QVariant::fromValue(song.artists);
    case DtRole:
        return QVariant::fromValue(song.duration);
    case UrlRole:
        return QVariant::fromValue(song.url);
    case NameRole:
        return QVariant::fromValue(song.name);
    case AlPicUrlRole:
        return QVariant::fromValue(song.albumPicUrl);
    case FileSizeRole:
        return QVariant::fromValue(song.fileSize);
    default:
        return QVariant();
        break;
    }
}

void SongsModel::startInsertingRow(int index){
    beginInsertRows(QModelIndex(),index,index);
}

void SongsModel::endInsertingRow(){
    endInsertRows();
}

void SongsModel::startInsertingRows(int begin,int end){
    beginInsertRows(QModelIndex(),begin,end);
}

void SongsModel::endInsertingRows(){
    endInsertRows();
}

void SongsModel::clear(){
    beginResetModel();
    m_data->clear();
    endResetModel();
}

}
