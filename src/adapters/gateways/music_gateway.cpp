#include "music_gateway.h"

#include <QJsonDocument>
#include <QJsonObject>
#include <QJsonArray>
#include <QVariant>
#include <QDebug>
#include <iostream>

#include "album.h"
#include "song.h"
#include <tpropertymap.h>

using namespace TagLib;
using namespace std;
namespace adapters {
MusicGateway::MusicGateway(IMusicAccess* access):m_access(access){
    connect(m_access,&IMusicAccess::getSelectiveAlbumFinished,this,&MusicGateway::processSelectiveAlbum);
    connect(m_access,&IMusicAccess::getAlbumDetailFinished,this,&MusicGateway::processAlbumDetail);
    connect(m_access,&IMusicAccess::getSongUrlFinshed,this,&MusicGateway::processSongUrl);
}

void MusicGateway::getSongUrl(long long id){
    m_access->getSongUrl(id);
}

void MusicGateway::getSelectiveAlbum(){
    m_access->getSelectiveAlbum();
}

void MusicGateway::getAlbumDetail(long long id){
    m_access->getAlbumDetail(id);
}

domain::Album MusicGateway::getAlbumFromJson(const QJsonObject& values){
    QStringList tags=formatTags(values["tags"].toArray());

    domain::Album album{
        .id=values["id"].toVariant().toLongLong(),
        .name=values["name"].toString(),
        .subscribedCount=values["subscribedCount"].toVariant().toLongLong(),
        .trackCount=values["trackCount"].toVariant().toLongLong(),
        .createTime=values["createTime"].toVariant().toLongLong(),
        .coverImgUrl=QUrl{values["coverImgUrl"].toString()},
        .desc=values["description"].toString(),
        .tags=tags,
        .playCount=values["playCount"].toVariant().toLongLong()
    };
    return album;
}

void MusicGateway::processSongUrl(const QByteArray& data){
    auto object=QJsonDocument::fromJson(data).object();
    auto result=(object["data"].toArray()[0]).toObject();
    QUrl songUrl=QUrl{ result["url"].toString() };
    long long id=result["id"].toVariant().toLongLong();
    emit getSongUrlFinshed(id,songUrl);
}

void MusicGateway::processSelectiveAlbum(const QByteArray& data){
    auto metadataObject = QJsonDocument::fromJson(data).object();
    auto results = metadataObject["playlists"].toArray();

    QVector<domain::Album> albums;
    for(const auto& result : results){
        auto resultObject = result.toObject();
        auto album = getAlbumFromJson(resultObject);
        albums.emplace_back(album);
    }
    emit getSelectiveAlbumFinshed(albums);
}

QStringList MusicGateway::formatTags(const QJsonArray& array){
    QStringList result;
    for(auto& value:array){
        result.append(value.toString());
    }
    return result;
}

domain::Song MusicGateway::getSongFromJson(const QJsonObject& values){
    const auto &[albumName,albumPicUrl]=formatAlbum(values["al"].toObject());
    domain::Song song{
        .id=values["id"].toVariant().toLongLong(),
        .album=albumName,
        .albumPicUrl=albumPicUrl,
        .name=values["name"].toString(),
        .duration=values["dt"].toVariant().toLongLong()
    };
    return song;
}

QPair<QString,QString> MusicGateway::formatAlbum(const QJsonObject& object){
    return { object["name"].toString(),object["picUrl"].toString() };
}

QPair<QString,QUrl> MusicGateway::formatCreator(const QJsonObject& object){
    QString nickName=object["nickname"].toString();
    QUrl avatarImgUrl=object["avatarUrl"].toString();
    return {nickName,avatarImgUrl};
}

void MusicGateway::processAlbumDetail(const QByteArray& data){
    auto metadataObject = QJsonDocument::fromJson(data).object();

    auto result = metadataObject["playlist"].toObject();
    const auto& [nickName,nickUrl]=formatCreator(result["creator"].toObject());
    QString name=result["name"].toString();
    QUrl coverImgUrl=result["coverImgUrl"].toString();
    QString desc=result["description"].toString();
    auto tracks = result["tracks"].toArray();

    QVector<domain::Song> songs;
    for(const auto& track:tracks){
        auto object=track.toObject();
        auto song = getSongFromJson(object);
        songs.append(song);
    }
    emit getAlbumDetailFinshed(name,desc,coverImgUrl,songs,nickName,nickUrl);
}

}

