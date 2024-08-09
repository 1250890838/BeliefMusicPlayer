#ifndef LOCALMUSICACCESS_H
#define LOCALMUSICACCESS_H
#include "i_local_music_access.h"

#include <QStringList>

namespace infrastructure {
class LocalMusicAccess : public adapters::ILocalMusicAccess
{
    Q_OBJECT
public:
    LocalMusicAccess();
    virtual void addSearcPath(const QString&) override; //添加扫描的目录
    virtual QStringList getLocalMusicPaths() override;//获取本地音乐路径
private:
    QStringList searchPaths;
};

}

#endif // LOCALMUSICACCESS_H
