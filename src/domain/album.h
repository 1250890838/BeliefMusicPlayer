#ifndef ALBUM_H
#define ALBUM_H
#include <QDateTime>
#include <QUrl>
#include <QString>
namespace domain{
struct Album{
    long long id;
    QString name;
    long long subscribedCount;
    long long trackCount;
    long long createTime;
    QUrl coverImgUrl;
    QString desc;
    QStringList tags;
    long long playCount;
};
}
#endif // ALBUM_H
