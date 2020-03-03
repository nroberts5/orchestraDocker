cmake_minimum_required(VERSION 3.6)

project(demo)

# Uncomment for optional debugging
#set(CMAKE_VERBOSE_MAKEFILE ON)

set(CMAKE_BUILD_TYPE Release)
set(OX_INSTALL_DIRECTORY /usr/src/orchestra/orchestra-sdk-1.8-1)


# TOPDIR is the root of the source tree
set(OX_INSTALL_DIRECTORY "" CACHE PATH "Install directory of the GE Orchestra SDK")
set(TOPDIR "${OX_INSTALL_DIRECTORY}/include")
set(LARGE_LIBRARY_TYPE STATIC)

message( "OX_INSTALL_DIRECTORY = ${OX_INSTALL_DIRECTORY}")

message("Configuring GE SDK Recon Build")
set(PRODUCT EXTERNAL_SDK)

# Include recon libraries exported from the SDK CMake build
set(RECON_LIBRARIES_INCLUDE_FILE ${OX_INSTALL_DIRECTORY}/lib/ReconLibraries.cmake)
if(EXISTS ${RECON_LIBRARIES_INCLUDE_FILE})
    include (${RECON_LIBRARIES_INCLUDE_FILE})
else()
    message("Could not find ${RECON_LIBRARIES_INCLUDE_FILE}")
    message(FATAL_ERROR "Verify that the CMake OX_INSTALL_DIRECTORY option is set correctly")
endif()

# Include SDK build configuration
include (${TOPDIR}/recon/SDK/product.cmake)

set(SOURCE_FILES main.cpp)

add_executable(${PROJECT_NAME} ${SOURCE_FILES})

target_link_libraries(${PROJECT_NAME} Arc)
target_link_libraries(${PROJECT_NAME} Cartesian2D)
target_link_libraries(${PROJECT_NAME} Cartesian3D)
target_link_libraries(${PROJECT_NAME} Gradwarp)
target_link_libraries(${PROJECT_NAME} Legacy)
target_link_libraries(${PROJECT_NAME} Core)
target_link_libraries(${PROJECT_NAME} CalibrationCommon)
target_link_libraries(${PROJECT_NAME} Control)
target_link_libraries(${PROJECT_NAME} Common)
target_link_libraries(${PROJECT_NAME} Crucial)
target_link_libraries(${PROJECT_NAME} Dicom)
target_link_libraries(${PROJECT_NAME} ProcessingControl)
target_link_libraries(${PROJECT_NAME} Hdf5)
target_link_libraries(${PROJECT_NAME} Math)
target_link_libraries(${PROJECT_NAME} System)
target_link_libraries(${PROJECT_NAME} ${OX_3P_LIBS})
target_link_libraries(${PROJECT_NAME} ${OX_OS_LIBS})
