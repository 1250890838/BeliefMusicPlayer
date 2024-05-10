set(CMAKE_WINDOWS_EXPORT_ALL_SYMBOLS ON)
add_library(application SHARED
    interface/services/i_music_service.h
    application_export.hpp
    interface/gateways/i_music_gateway.h
    music_service.h music_service.cpp
    playback_service.h playback_service.cpp
    interface/services/i_playback_service.h

)

target_compile_definitions(application PRIVATE APPLICATION_LIBRARY)
target_include_directories(application
                PUBLIC
                ${CMAKE_CURRENT_SOURCE_DIR}
                ${CMAKE_CURRENT_SOURCE_DIR}/interface/services
                ${CMAKE_CURRENT_SOURCE_DIR}/interface/gateways
                ${CMAKE_CURRENT_SOURCE_DIR}
                ${DOMAIN_INCLUDES}
            )
target_link_libraries(application
                PRIVATE
                    Qt6::Core
                    Qt6::Quick
                    Qt6::Network
                    Qt6::Multimedia
)
target_compile_definitions(application
                PRIVATE
                    $<$<OR:$<CONFIG:Debug>,$<CONFIG:RelWithDebInfo>>:QT_QML_DEBUG>
)
