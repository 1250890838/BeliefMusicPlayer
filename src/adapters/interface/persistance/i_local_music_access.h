#ifndef I_LOCAL_MUSIC_ACCESS_H
#define I_LOCAL_MUSIC_ACCESS_H
#include <QObject>
#include <QStringList>

#include "adapters_export.hpp"
namespace adapters{
class ADAPTERS_EXPORT ILocalMusicAccess : public QObject{
    Q_OBJECT
public:
    virtual ~ILocalMusicAccess() noexcept = default;
    virtual void addSearcPath(const QString&) = 0; //添加扫描的目录
    virtual QStringList getLocalMusicPaths() = 0; //获取本地音乐路径
signals:
    // void getLocalMusicPathsFinshed(const QStringList&);
};
}
#endif // I_LOCAL_MUSIC_ACCESS_H
