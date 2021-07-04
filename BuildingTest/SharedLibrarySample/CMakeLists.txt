project(SharedLibrarySample)

set(prj_root ${CMAKE_CURRENT_SOURCE_DIR})
file (GLOB_RECURSE prj_headerFiles "${prj_root}/*.h" "${prj_root}/*.h")
file (GLOB_RECURSE prj_srcFiles "${prj_root}/*.c" "${prj_root}/*.cpp")

add_library(${PROJECT_NAME} SHARED 
	${prj_headerFiles} 
	${prj_srcFiles})
use_group_folder()