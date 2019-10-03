set(LIBHELLO_VERSION v1.0)
set(LIBHELLO_URL https://github.com/tomlankhorst/cmake-prebuilt-library/releases/download/${LIBHELLO_VERSION}/libhello.a)
set(LIBHELLO_PATH ${CMAKE_BINARY_DIR}/import/libhello.a)

file(DOWNLOAD ${LIBHELLO_URL} ${LIBHELLO_PATH} STATUS LIBHELLO_DOWNLOAD_STATUS)
list(GET LIBHELLO_DOWNLOAD_STATUS 0 LIBHELLO_DOWNLOAD_STATUS_NO)

if(LIBHELLO_DOWNLOAD_STATUS_NO)
    message(STATUS "Pre-built library not downloaded. Building from source. (${LIBHELLO_DOWNLOAD_STATUS})")
    file(REMOVE ${LIBHELLO_PATH})
else()
    message(STATUS "Linking downloaded pre-built library.")
endif()

if(EXISTS ${LIBHELLO_PATH})
    add_library(hello STATIC IMPORTED)
    set_target_properties(hello PROPERTIES
            IMPORTED_LOCATION ${LIBHELLO_PATH}
            INTERFACE_INCLUDE_DIRECTORIES ${CMAKE_SOURCE_DIR}/include/libhello
            )
else()
    add_library(hello src/libhello/hello.cpp)
    target_include_directories(hello PUBLIC include/libhello)
endif()