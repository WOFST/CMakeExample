project(ExecuteSample)

fetch_project_source_files()

add_executable (${PROJECT_NAME}
	${prj_headerFiles} 
	${prj_srcFiles})
use_group_folder()