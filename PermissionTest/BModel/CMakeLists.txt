project(BModel)

fetch_project_source_files()

add_executable (${PROJECT_NAME}
	${prj_headerFiles} 
	${prj_srcFiles})
	
# target_link_libraries ( ${PROJECT_NAME} PRIVATE )

use_group_folder()