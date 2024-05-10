#include "music_access.h"

#include <QNetworkAccessManager>
#include <QNetworkRequest>
#include <QNetworkReply>

#include "api_error_helper.h"
#include "endpoints.h"
namespace infrastructure{
MusicAccess::MusicAccess(){
}

void MusicAccess::getSongUrl(long long id){
    const int limit=9;
    auto url = data::songUrlEndpoint + "?id=" + QString::number(id);
    auto request = createRequest(url);
    auto reply = m_networkAccessManager.get(request);
    connect(reply, &QNetworkReply::finished, this,
            [this, reply](){
                if(api_error_helper::apiRequestFailed(reply,200)){
                    api_error_helper::logErrorMessage(reply,"get selective album");
                    reply->deleteLater();
                    return;
                }
                reply->deleteLater();
                emit getSongUrlFinshed(reply->readAll());
            });
}

void MusicAccess::getSelectiveAlbum(){
    const int limit=9;
    auto url = data::topPlaylistEndpoint + "?limit=" + QString::number(limit);
    auto request = createRequest(url);
    auto reply = m_networkAccessManager.get(request);
    connect(reply, &QNetworkReply::finished, this,
            [this, reply](){
            if(api_error_helper::apiRequestFailed(reply,200)){
                api_error_helper::logErrorMessage(reply,"get selective album");
                reply->deleteLater();
                return;
            }
                reply->deleteLater();
                emit getSelectiveAlbumFinished(reply->readAll());
            });
}

void MusicAccess::getAlbumDetail(long long id){
    auto url=data::playlistDetailEndpoint+ "?id=" + QString::number(id);
    auto request = createRequest(url);
    auto reply=m_networkAccessManager.get(request);
    connect(reply, &QNetworkReply::finished, this,
            [this, reply](){
                if(api_error_helper::apiRequestFailed(reply,200)){
                    api_error_helper::logErrorMessage(reply,"get album detail");
                    reply->deleteLater();
                    return;
                }
                reply->deleteLater();
                emit getAlbumDetailFinished(reply->readAll());
            });
}

QNetworkRequest MusicAccess::createRequest(const QUrl& url){
    QNetworkRequest result { url };
    QSslConfiguration sslConfiguration = result.sslConfiguration();
    sslConfiguration.setProtocol(QSsl::AnyProtocol);
    sslConfiguration.setPeerVerifyMode(QSslSocket::QueryPeer);
    result.setSslConfiguration(sslConfiguration);
    return result;
}
}
