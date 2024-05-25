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
    Q_PROPERTY(QString creatorName READ creatorName CONSTANT NOTIFY creatorNameChanged)
    Q_PROPERTY(QUrl creatorImgUrl READ creatorImgUrl NOTIFY creatorImgUrlChanged)

public:
    QString name();
    QUrl coverImgUrl();
    QString desc();
    SongsModel* songsModel();
    QString creatorName();
    QUrl creatorImgUrl();

public slots:
    void setName(const QString&);
    void setCoverImgUrl(const QUrl&);
    void setDesc(const QString&);
    void setCreatorImgUrl(const QUrl&);
    void setCreatorName(const QString&);
    void addNewSong(int index);
    void addNewSongEnd();
    void clear();

public:
    explicit AlbumDetail(QVector<domain::Song>*);

signals:
    void nameChanged(const QString&);
    void coverImgUrlChanged(const QUrl&);
    void descChanged(const QString&);
    void creatorNameChanged(const QString&);
    void creatorImgUrlChanged(const QUrl&);

private:
    QString m_name;
    QUrl m_coverImgUrl;
    QString m_desc;
    SongsModel m_songsModel;
    QString m_creatorName;
    QUrl m_creatorImgUrl;
};
}
#endif // ALBUMDETAIL_VALUEOBJECT_H
