project(AModel)

fetch_project_source_files()

add_executable (${PROJECT_NAME}
	${prj_headerFiles} 
	${prj_srcFiles})

target_link_libraries ( ${PROJECT_NAME} 
	PRIVATE 
	BasedModel
	)
	
use_group_folder()