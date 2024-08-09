#include "local_music_access.h"

#include <qstandardpaths.h>
#include <QDir>
#include <QSettings>
#include "local_media_files_suffix_filter.h"

namespace infrastructure {
LocalMusicAccess::LocalMusicAccess(){
    QString musicLocation=QStandardPaths::standardLocations(QStandardPaths::MusicLocation)[0];
    QString downloadLocation=QStandardPaths::standardLocations(QStandardPaths::DownloadLocation)[0];
    searchPaths<<musicLocation<<downloadLocation;
}

void LocalMusicAccess::addSearcPath(const QString& path){
    searchPaths.append(path);
    QSettings settings;
    QString extraSearchPath=settings.value("extraSearchPath").toString();
    extraSearchPath.append(";");
    extraSearchPath.append(path);
    settings.setValue("extraSearchPath",extraSearchPath);
}

QStringList LocalMusicAccess::getLocalMusicPaths(){
    QDir dir;
    QStringList result;
    for(const auto& path:searchPaths){
        if(!dir.exists(path))
            continue;
        dir.setPath(path);
        QStringList filters=QString(LOCAL_MEDIA_FILES_SUFFIX_FILTER).split(u';');
        dir.setNameFilters(filters);
        QStringList files=dir.entryList(QDir::Files);
        for(QString& file:files){
            file=dir.absolutePath()+'/'+file;
        }
        result.append(files);
    }
    return result;
}

}
