#pragma once
#include <QtCore/QtGlobal>

#if defined(INFRASTRUCTURE_LIBRARY)
#define INFRASTRUCTURE_EXPORT Q_DECL_EXPORT
#else
#define INFRASTRUCTURE_EXPORT Q_DECL_IMPORT
#endif
