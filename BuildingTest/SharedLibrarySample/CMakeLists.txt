project(SharedLibrarySample)

fetch_project_source_files()

add_library(${PROJECT_NAME} SHARED 
	${prj_includeFiles} 
	${prj_interfaceFiles} 
	${prj_headerFiles} 
	${prj_srcFiles}
	)

# target include directories and install 
target_include_directories(${PROJECT_NAME}
	PRIVATE
	${prj_root}
	PUBLIC
	$<BUILD_INTERFACE:${common_includeRoot}> $<INSTALL_INTERFACE:include>
	$<BUILD_INTERFACE:${common_interfaceRoot}> $<INSTALL_INTERFACE:interface>
	$<BUILD_INTERFACE:${prj_includeRoot}> $<INSTALL_INTERFACE:include/${PROJECT_NAME}>
	$<BUILD_INTERFACE:${prj_interfaceRoot}> $<INSTALL_INTERFACE:interface/${PROJECT_NAME}>
)

use_group_folder()