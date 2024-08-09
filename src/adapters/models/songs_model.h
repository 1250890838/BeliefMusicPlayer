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
        NameRole,
        FileSizeRole
    };
public:
    explicit SongsModel() = default;
    explicit SongsModel(QVector<domain::Song>* songs);
    int rowCount(const QModelIndex & parent = QModelIndex()) const;
    QVariant data(const QModelIndex & index, int role) const;
public slots:
    void startInsertingRow(int index);
    void startInsertingRows(int begin,int end);
    void endInsertingRow();
    void endInsertingRows();
    void clear();
protected:
    QHash<int, QByteArray> roleNames() const;
private:
    QVector<domain::Song> *m_data;
};
}
#endif // SONGSMODEL_H
