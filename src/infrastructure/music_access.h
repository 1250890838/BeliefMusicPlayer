#ifndef MUSICACCESS_H
#define MUSICACCESS_H

#include "i_music_access.h"
#include <QObject>
#include <QNetworkRequest>
#include <QNetworkAccessManager>

namespace infrastructure{
class MusicAccess : public adapters::IMusicAccess
{
    Q_OBJECT
public:
    void getSongUrl(long long) override;
    void getSelectiveAlbum() override;
    void getAlbumDetail(long long id) override;
    MusicAccess();
private:
    QNetworkRequest createRequest(const QUrl& url);

    QNetworkAccessManager m_networkAccessManager;
signals:

};
}
#endif // MUSICACCESS_H
