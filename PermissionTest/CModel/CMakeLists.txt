project(CModel)

file (GLOB_RECURSE prj_headerFiles "${CMAKE_CURRENT_SOURCE_DIR}/*.h" "${CMAKE_CURRENT_SOURCE_DIR}/*.h")
file (GLOB_RECURSE prj_srcFiles "${CMAKE_CURRENT_SOURCE_DIR}/*.c" "${CMAKE_CURRENT_SOURCE_DIR}/*.cpp")

add_executable (${PROJECT_NAME}
	${prj_headerFiles} 
	${prj_srcFiles})
	
# target_link_libraries ( ${PROJECT_NAME} PRIVATE )

use_group_folder()