#ifndef I_MUSIC_ACCESS_H
#define I_MUSIC_ACCESS_H
#include <QObject>
#include "adapters_export.hpp"
namespace adapters{
class ADAPTERS_EXPORT IMusicAccess : public QObject{
    Q_OBJECT
public:
    virtual ~IMusicAccess() noexcept = default;
    virtual void getSongUrl(long long) = 0;
    virtual void getSelectiveAlbum() = 0;
    virtual void getAlbumDetail(long long id) = 0;

signals:
    void getSelectiveAlbumFinished(const QByteArray&);
    void getAlbumDetailFinished(const QByteArray&);
    void getSongUrlFinshed(const QByteArray&);
};
}
#endif // I_MUSIC_ACCESS_H
