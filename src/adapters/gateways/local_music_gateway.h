#ifndef LOCALMUSICGATEWAY_H
#define LOCALMUSICGATEWAY_H

#include <QObject>
#include <i_local_music_access.h>
#include <i_local_music_gateway.h>
#include "i_local_music_access.h"

namespace adapters {
class LocalMusicGateway : public application::ILocalMusicGateway
{
    Q_OBJECT
public:
    LocalMusicGateway(ILocalMusicAccess* access);
    virtual QList<domain::Song> getLocalMediaFiles(QString filter) override;
    virtual void addSearchPath(const QString&) override;
private:
    ILocalMusicAccess* m_access;
};
}
#endif // LOCALMUSICGATEWAY_H
