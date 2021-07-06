cmake_minimum_required (VERSION 3.16)

project (CMakeExample VERSION 1.0.0.0)

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

# Enable test 
enable_testing()

# BuildingTest
add_subdirectory(BuildingTest)
add_subdirectory(CTest)
add_subdirectory(InstallTest)
add_subdirectory(PackageTest)
#add_subdirectory(OtherTest)

# -----------------------for install and package ----------------- #
# install document 
install(FILES ${CMAKE_SOURCE_DIR}/README.md DESTINATION doc)
install(DIRECTORY  ${CMAKE_SOURCE_DIR}/doc/ DESTINATION doc)

# configure a header file to pass the version number only
configure_file(${CMAKE_SOURCE_DIR}/Tools/cmake/CMakeExampleVersion.h.in 
	${PROJECT_BINARY_DIR}/CMakeExampleVersion.h)
# install version header file
install(FILES ${PROJECT_BINARY_DIR}/CMakeExampleVersion.h
  DESTINATION include/CMakeExample
  )

# for config file 
include(CMakePackageConfigHelpers)

# generate the config file that is includes the exports
configure_package_config_file(${CMAKE_SOURCE_DIR}/Tools/cmake/Config.cmake.in
  ${CMAKE_CURRENT_BINARY_DIR}/CMakeExampleConfig.cmake
  INSTALL_DESTINATION lib/cmake/${PROJECT_NAME}
  )
# generate the version file for the config file
write_basic_package_version_file(
  ${CMAKE_CURRENT_BINARY_DIR}/CMakeExampleConfigVersion.cmake
  VERSION "${CMakeExample_VERSION_MAJOR}.${CMakeExample_VERSION_MINOR}.${CMakeExample_VERSION_PATCH}.${CMakeExample_VERSION_TWEAK}"
  COMPATIBILITY AnyNewerVersion
)

# install the configuration file
install(FILES
  ${CMAKE_CURRENT_BINARY_DIR}/CMakeExampleConfigVersion.cmake
  DESTINATION lib/cmake/${PROJECT_NAME}
  )

include(InstallRequiredSystemLibraries)
set(CPACK_PACKAGE_DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR}/packages)
set(CPACK_PACKAGE_DESCRIPTION "CMakeExample")
set(CPACK_GENERATOR "ZIP")
set(CPACK_RESOURCE_FILE_LICENSE "${CMAKE_CURRENT_SOURCE_DIR}/License.txt")
set(CPACK_PACKAGE_VERSION_MAJOR "${CMakeExample_VERSION_MAJOR}")
set(CPACK_PACKAGE_VERSION_MINOR "${CMakeExample_VERSION_MINOR}")
set(CPACK_PACKAGE_VERSION_PATCH "${CMakeExample_VERSION_PATCH}")
include(CPack)