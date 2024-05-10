#ifndef SONG_H
#define SONG_H
#include <QStringList>
#include <QString>
#include <QUrl>
namespace domain{
struct Song{
    long long id;
    QStringList artists;
    QString album;
    QString name;
    long long duration;
    QUrl url;
};
}
#endif // SONG_H
