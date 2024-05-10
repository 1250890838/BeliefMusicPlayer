#ifndef ALBUMSMODEL_H
#define ALBUMSMODEL_H

#include <QAbstractListModel>
#include <QDateTime>
#include <QUrl>

#include "adapters_export.hpp"
#include "album.h"

namespace adapters::model{

class ADAPTERS_EXPORT AlbumsModel : public QAbstractListModel
{
    Q_OBJECT
public:
    enum AlbumRoles {
        IdRole = Qt::UserRole + 1,
        SubscrRole,
        TrackCountRole,
        CreateTimeRole,
        CoverImgUrlRole,
        DescRole,
        TagsRole,
        PlayCountRole,
        NameRole,
    };
    explicit AlbumsModel()=default;
    explicit AlbumsModel(QVector<domain::Album> *m_albums);

    int rowCount(const QModelIndex & parent = QModelIndex()) const;
    QVariant data(const QModelIndex & index, int role) const;
    void clear();
public slots:
    void startInsertingRow(int index);
    void endInsertingRow();

protected:
    QHash<int, QByteArray> roleNames() const;
private:
    QVector<domain::Album> *m_data;
};
}
#endif // ALBUMSMODEL_H
