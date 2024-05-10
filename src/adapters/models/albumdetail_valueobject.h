#ifndef ALBUMDETAIL_VALUEOBJECT_H
#define ALBUMDETAIL_VALUEOBJECT_H
#include <QObject>
#include "adapters_export.hpp"
#include "songs_model.h"

namespace adapters::model{
class ADAPTERS_EXPORT AlbumDetail : public QObject
{
    Q_OBJECT
    Q_PROPERTY(QString name READ name NOTIFY nameChanged CONSTANT)
    Q_PROPERTY(QUrl coverImgUrl READ coverImgUrl NOTIFY coverImgUrlChanged CONSTANT)
    Q_PROPERTY(QString desc READ desc NOTIFY descChanged CONSTANT)
    Q_PROPERTY(SongsModel* songsModel READ songsModel CONSTANT)
public:
    QString name();
    QUrl coverImgUrl();
    QString desc();
    SongsModel* songsModel();

public slots:
    void setName(const QString&);
    void setCoverImgUrl(const QUrl&);
    void setDesc(const QString&);
    void addNewSong(int index);
    void addNewSongEnd();

public:
    explicit AlbumDetail(QVector<domain::Song>*);

signals:
    void nameChanged(const QString&);
    void coverImgUrlChanged(const QUrl&);
    void descChanged(const QString&);
private:
    QString m_name;
    QUrl m_coverImgUrl;
    QString m_desc;
    SongsModel m_songsModel;
};
}
#endif // ALBUMDETAIL_VALUEOBJECT_H
