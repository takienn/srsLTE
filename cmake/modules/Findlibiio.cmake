if(NOT ZED_FOUND)
  pkg_check_modules (ZED_PKG libiio)
  find_path(ZED_INCLUDE_DIRS NAMES iio.h
    PATHS
    ${ZED_PKG_INCLUDE_DIRS}
    /usr/include
    /usr/local/include
  )

  find_library(ZED_LIBRARIES NAMES libiio.so
    PATHS
    ${ZED_PKG_LIBRARY_DIRS}
    /usr/lib
    /usr/local/lib
  )

if(ZED_INCLUDE_DIRS AND ZED_LIBRARIES)
  set(ZED_FOUND TRUE CACHE INTERNAL "libiio found")
  message(STATUS "Found libiio: ${ZED_INCLUDE_DIRS}, ${ZED_LIBRARIES}")
else(ZED_INCLUDE_DIRS AND ZED_LIBRARIES)
  set(ZED_FOUND FALSE CACHE INTERNAL "libiio found")
  message(STATUS "libiio not found.")
endif(ZED_INCLUDE_DIRS AND ZED_LIBRARIES)

mark_as_advanced(ZED_LIBRARIES ZED_INCLUDE_DIRS)

endif(NOT ZED_FOUND)
