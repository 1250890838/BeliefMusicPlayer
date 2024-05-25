#ifndef MUSICGATEWAY_H
#define MUSICGATEWAY_H
#include "i_music_gateway.h"
#include "i_music_access.h"
#include "album.h"
#include "song.h"

namespace adapters {
class MusicGateway : public application::IMusicGateway
{
public:
    MusicGateway(IMusicAccess* access);
    virtual void getSongUrl(long long) override;
    virtual void getSelectiveAlbum() override;
    virtual void getAlbumDetail(long long id) override;
private slots:
    void processSongUrl(const QByteArray&);
    void processSelectiveAlbum(const QByteArray&);
    void processAlbumDetail(const QByteArray&);
private:
    QPair<QString,QString> formatAlbum(const QJsonObject&);
    QPair<QString,QUrl> formatCreator(const QJsonObject&);
    domain::Song getSongFromJson(const QJsonObject&);

    QStringList formatTags(const QJsonArray&);
    domain::Album getAlbumFromJson(const QJsonObject&);
    adapters::IMusicAccess* m_access;
};
}
#endif // MUSICGATEWAY_H
