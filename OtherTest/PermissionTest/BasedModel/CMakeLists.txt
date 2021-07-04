project(BasedModel)

fetch_project_source_files()

add_library(${PROJECT_NAME} SHARED 
	${prj_headerFiles} 
	${prj_srcFiles}
	)
	
target_include_directories (${PROJECT_NAME}
	PRIVATE 
	${CMAKE_CURRENT_SOURCE_DIR}/include
	)

target_link_libraries ( ${PROJECT_NAME} 
	PRIVATE 
	PrivateModel
	INTERFACE
	InterfaceModel
	PUBLIC
	PublicModel
	)

use_group_folder()