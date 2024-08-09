#include "local_music_gateway.h"
#include "fileref.h"
#include <QFile>
#include <tpropertymap.h>
#include <QFileInfo>

namespace adapters{
LocalMusicGateway::LocalMusicGateway(ILocalMusicAccess* access):m_access(access){
}

QList<domain::Song> LocalMusicGateway::getLocalMediaFiles(QString filter){
    QStringList paths=m_access->getLocalMusicPaths();
    QList<domain::Song> songs;
    for(const auto& path:paths){
        if(!QFile(path).exists())
            continue;
        TagLib::FileRef file(path.toStdString().c_str());
        auto tag=file.tag();
        if(!tag)
            continue;
        QString artists=tag->artist().toCString();
        QString album=tag->album().toCString();
        QString name=tag->title().toCString();
        QFileInfo fileInfo(path);
        QString fileName=fileInfo.fileName();

        if(!filter.isEmpty()){
            if(artists.contains(filter,Qt::CaseInsensitive) ||
                album.contains(filter,Qt::CaseInsensitive) ||
                name.contains(filter,Qt::CaseInsensitive) ||
                fileName.contains(filter,Qt::CaseInsensitive)){
            }
            else
                continue;
        }
        domain::Song song{
            .artists={tag->artist().toCString()},
            .album=tag->album().toCString(),
            .name=tag->title().toCString(),
            .url=path,
            .fileSize=fileInfo.size()
        };
        songs<<song;
    }
    return songs;
}

void LocalMusicGateway::addSearchPath(const QString& path){
    m_access->addSearcPath(path);
}

}
