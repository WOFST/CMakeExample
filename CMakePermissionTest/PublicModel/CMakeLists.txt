project(PublicModel)

file (GLOB_RECURSE prj_headerFiles "${CMAKE_CURRENT_SOURCE_DIR}/*.h" "${CMAKE_CURRENT_SOURCE_DIR}/*.h")
file (GLOB_RECURSE prj_srcFiles "${CMAKE_CURRENT_SOURCE_DIR}/*.c" "${CMAKE_CURRENT_SOURCE_DIR}/*.cpp")

add_library(${PROJECT_NAME} SHARED 
	${prj_headerFiles} 
	${prj_srcFiles}
	)
	
target_include_directories (${PROJECT_NAME}
	PUBLIC 
	${CMAKE_CURRENT_SOURCE_DIR}/include
	)
# target_link_libraries ( ${PROJECT_NAME} PRIVATE )