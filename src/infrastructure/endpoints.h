#ifndef ENDPOINTS_H
#define ENDPOINTS_H
#include <QString>
namespace infrastructure::data {
namespace{
    inline const QString domain="http://localhost:3000";
}
inline const QString topPlaylistEndpoint=domain+"/top/playlist/highquality";
inline const QString playlistDetailEndpoint=domain+"/playlist/detail";
inline const QString songUrlEndpoint=domain+"/song/url";
}
#endif // ENDPOINTS_H
