#ifndef I_LOCAL_MUSIC_GATEWAY_H
#define I_LOCAL_MUSIC_GATEWAY_H

#include <QObject>
#include "application_export.hpp"
#include "song.h"

namespace application{
class APPLICATION_EXPORT ILocalMusicGateway : public QObject
{
    Q_OBJECT
public:
    virtual ~ILocalMusicGateway() noexcept = default;
    virtual QList<domain::Song> getLocalMediaFiles(QString) = 0;
    virtual void addSearchPath(const QString&) = 0;
};
}
#endif // I_LOCAL_MUSIC_GATEWAY_H
