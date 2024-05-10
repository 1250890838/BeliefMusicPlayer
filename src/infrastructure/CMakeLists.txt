set(CMAKE_WINDOWS_EXPORT_ALL_SYMBOLS ON)
add_library(infrastructure SHARED
    music_access.h music_access.cpp
    infrastructure_export.h
    endpoints.h
    api_error_helper.h )

target_include_directories(infrastructure
                PUBLIC
                ${CMAKE_CURRENT_SOURCE_DIR}/interface
                ${CMAKE_CURRENT_SOURCE_DIR}
                PRIVATE
                ${ADAPTERS_INCLUDES}
                )
target_link_libraries(infrastructure
                PRIVATE
                    adapters
                    Qt6::Core
                    Qt6::Quick
                    Qt6::Network
)
target_compile_definitions(infrastructure
                PRIVATE
                    $<$<OR:$<CONFIG:Debug>,$<CONFIG:RelWithDebInfo>>:QT_QML_DEBUG>
)
