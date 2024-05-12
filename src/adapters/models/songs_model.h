#ifndef SONGSMODEL_H
#define SONGSMODEL_H

#include <QAbstractListModel>
#include <QDateTime>
#include <QUrl>

#include "song.h"
#include "adapters_export.hpp"

namespace adapters::model{

class ADAPTERS_EXPORT SongsModel : public QAbstractListModel{
    Q_OBJECT
public:
    enum SongRoles {
        IdRole = Qt::UserRole + 1,
        ArRole,
        AlRole,
        AlPicUrlRole,
        DtRole,
        UrlRole,
        NameRole
    };
public:
    explicit SongsModel() = default;
    explicit SongsModel(QVector<domain::Song>* songs);
    int rowCount(const QModelIndex & parent = QModelIndex()) const;
    QVariant data(const QModelIndex & index, int role) const;
    void clear();
public slots:
    void startInsertingRow(int index);
    void endInsertingRow();
protected:
    QHash<int, QByteArray> roleNames() const;
private:
    QVector<domain::Song> *m_data;
};
}
#endif // SONGSMODEL_H
