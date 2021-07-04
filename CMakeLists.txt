cmake_minimum_required (VERSION 3.12)

project (CMakeExample)

# general configuration 
set (CMAKE_RUNTIME_OUTPUT_DIRECTORY "${CMAKE_SOURCE_DIR}/bin")
set_property(GLOBAL PROPERTY USE_FOLDERS ON)

# for install
set(CMAKE_INSTALL_PREFIX ${CMAKE_BINARY_DIR}/INSTALL/${PROJECT_NAME})

# Add user cmake module
list(APPEND CMAKE_MODULE_PATH ${CMAKE_SOURCE_DIR}/Tools/CMake)
include(general)

# optional 
# target source group
option(keep_source_group_tree "Keep source group with local file system" OFF)

# BuildingTest
add_subdirectory(BuildingTest)
add_subdirectory(CTest)
add_subdirectory(InstallTest)
add_subdirectory(PackageTest)
add_subdirectory(OtherTest)
