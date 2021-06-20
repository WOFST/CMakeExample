cmake_minimum_required (VERSION 3.12)

project (CmakeAccessTest)

set (CMAKE_RUNTIME_OUTPUT_DIRECTORY "${CMAKE_SOURCE_DIR}/bin")
set_property(GLOBAL PROPERTY USE_FOLDERS ON)

# CMakePermissionTest
add_subdirectory(CMakePermissionTest/InterfaceModel)
add_subdirectory(CMakePermissionTest/PrivateModel)
add_subdirectory(CMakePermissionTest/PublicModel)
add_subdirectory(CMakePermissionTest/BasedModel)
add_subdirectory(CMakePermissionTest/AModel)
add_subdirectory(CMakePermissionTest/BModel)
add_subdirectory(CMakePermissionTest/CModel)