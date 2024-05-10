#include "albums_model.h"
namespace adapters::model{

AlbumsModel::AlbumsModel(QVector<domain::Album> * albums):m_data(albums){
}

QHash<int, QByteArray> AlbumsModel::roleNames() const{
    QHash<int, QByteArray> roles;
    roles[IdRole] = "id";
    roles[SubscrRole] = "subscribe";
    roles[TrackCountRole] = "trackCount";
    roles[CreateTimeRole] = "createTime";
    roles[CoverImgUrlRole] = "coverImgUrl";
    roles[DescRole]="desc";
    roles[TagsRole]="tags";
    roles[PlayCountRole]="playCount";
    roles[NameRole]="name";
    return roles;
}

void AlbumsModel::startInsertingRow(int index){
    beginInsertRows(QModelIndex(), index, index);
}

void AlbumsModel::endInsertingRow(){
    endInsertRows();
}

int AlbumsModel::rowCount(const QModelIndex & parent) const{
    Q_UNUSED(parent);
    return m_data->count();
}

void AlbumsModel::clear(){
    beginResetModel();
    m_data->clear();
    endResetModel();
}

QVariant AlbumsModel::data(const QModelIndex & index, int role) const{
    if (index.row() < 0 || index.row() >= m_data->count())
        return QVariant();
    const domain::Album& album=m_data->at(index.row());
    AlbumRoles a;
    switch (role) {
    case IdRole:
        return QVariant::fromValue(album.id);
        break;
    case SubscrRole:
        return QVariant::fromValue(album.subscribedCount);
        break;
    case TrackCountRole:
        return QVariant::fromValue(album.trackCount);
        break;
    case CreateTimeRole:
        return QVariant::fromValue(album.createTime);
        break;
    case CoverImgUrlRole:
        return QVariant::fromValue(album.coverImgUrl);
        break;
    case DescRole:
        return QVariant::fromValue(album.desc);
        break;
    case TagsRole:
        return QVariant::fromValue(album.tags);
        break;
    case PlayCountRole:
        return QVariant::fromValue(album.playCount);
        break;
    case NameRole:
        return QVariant::fromValue(album.name);
    default:
        break;
    }
    return {};
}
}
