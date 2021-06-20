cmake_minimum_required (VERSION 3.12)

project (CmakeAccessTest)

set (CMAKE_RUNTIME_OUTPUT_DIRECTORY "${CMAKE_SOURCE_DIR}/bin")
set_property(GLOBAL PROPERTY USE_FOLDERS ON)

add_subdirectory(InterfaceModel)
add_subdirectory(PrivateModel)
add_subdirectory(PublicModel)
add_subdirectory(BasedModel)
add_subdirectory(AModel)
add_subdirectory(BModel)
add_subdirectory(CModel)