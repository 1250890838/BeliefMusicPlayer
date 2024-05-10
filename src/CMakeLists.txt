cmake_minimum_required(VERSION 3.16)

project(Belief VERSION 0.1 LANGUAGES CXX)

# language
set(CMAKE_CXX_STANDARD 20)
set(CMAKE_CXX_STANDARD_REQUIRED ON)
set(CMAKE_CXX_EXTENSIONS OFF)
set(CMAKE_AUTORCC ON)

find_package(Qt6 6.4 REQUIRED COMPONENTS Quick Multimedia)

find_package(QWindowKit REQUIRED)
qt_standard_project_setup()

add_subdirectory(domain/)
get_target_property(DOMAIN_INCLUDES domain INTERFACE_INCLUDE_DIRECTORIES)

add_subdirectory(application/)
get_target_property(APPLICATION_INCLUDES application INTERFACE_INCLUDE_DIRECTORIES)

add_subdirectory(adapters/)
get_target_property(ADAPTERS_INCLUDES adapters INTERFACE_INCLUDE_DIRECTORIES)

add_subdirectory(infrastructure/)
get_target_property(INFRASTRUCTURE_INCLUDES infrastructure INTERFACE_INCLUDE_DIRECTORIES)

add_subdirectory(presentation/)

qt_add_executable(Belief
    main.cpp
    dependency_injection.h
)

target_include_directories(Belief
    PRIVATE
    ${APPLICATION_INCLUDES}
    ${ADAPTERS_INCLUDES}
    ${INFRASTRUCTURE_INCLUDES}
    ${DOMAIN_INCLUDES}
)

# Qt for iOS sets MACOSX_BUNDLE_GUI_IDENTIFIER automatically since Qt 6.1.
# If you are developing for iOS or macOS you should consider setting an
# explicit, fixed bundle identifier manually though.
set_target_properties(Belief PROPERTIES
#    MACOSX_BUNDLE_GUI_IDENTIFIER com.example.appBelief
    MACOSX_BUNDLE_BUNDLE_VERSION ${PROJECT_VERSION}
    MACOSX_BUNDLE_SHORT_VERSION_STRING ${PROJECT_VERSION_MAJOR}.${PROJECT_VERSION_MINOR}
    MACOSX_BUNDLE TRUE
    WIN32_EXECUTABLE TRUE
)

target_link_libraries(Belief
    PRIVATE Qt6::Quick
    PUBLIC QWindowKit::Quick Qt6::Multimedia
    presentation
    adapters
    application
    infrastructure
    domain
)

include(GNUInstallDirs)
install(TARGETS Belief
    BUNDLE DESTINATION .
    LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR}
    RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR}
)
