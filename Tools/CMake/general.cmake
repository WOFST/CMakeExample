# name: use_group_folder
# param: 
# param with parent: group_folder、PROJECT_NAME
# return: 
function(use_group_folder)
	set_target_properties (${PROJECT_NAME} PROPERTIES FOLDER "${group_folder}")
endfunction()

# name: fetch_project_source_files
# param: 
# param with parent: [prj_root][、prj_includeRoot][、prj_interfaceRoot]
# return: PARENT_SCOPE: prj_includeFiles、prj_interfaceFiles、prj_headerFiles、prj_srcFiles
function(fetch_project_source_files)
	# error: frozen 
	# if (NOT prj_root)
		# set(prj_root ${CMAKE_CURRENT_SOURCE_DIR} PARENT_SCOPE)
	# endif ()
	
	set(prj_root ${CMAKE_CURRENT_SOURCE_DIR})
	
	set(common_includeRoot ${CMAKE_SOURCE_DIR}/include)
	set(prj_includeRoot ${common_includeRoot}/${PROJECT_NAME})
	
	set(common_interfaceRoot ${CMAKE_SOURCE_DIR}/interface)
	set(prj_interfaceRoot ${common_interfaceRoot}/${PROJECT_NAME})
	
	# Find file with GLOB_RECURSE
	if(EXISTS ${prj_includeRoot})
		file (GLOB_RECURSE prj_includeFiles ${prj_includeRoot}/*.h ${prj_includeRoot}/*.hpp)
	else()
		set(prj_includeFiles "")
	endif()
	
	if(EXISTS ${prj_interfaceRoot})
		file (GLOB_RECURSE prj_interfaceFiles ${prj_interfaceRoot}/*.h ${prj_interfaceRoot}/*.hpp)
	else()
		set(prj_interfaceFiles "")
	endif()
	
	file (GLOB_RECURSE prj_headerFiles ${prj_root}/*.h ${prj_root}/*.hpp)
	file (GLOB_RECURSE prj_srcFiles ${prj_root}/*.c ${prj_root}/*.cpp)
	file (GLOB_RECURSE prj_uiFiles ${prj_root}/*.ui)
	file (GLOB_RECURSE prj_transitionFiles ${prj_root}/*.ts)
	file (GLOB_RECURSE prj_resourceFiles ${prj_root}/*.rc)
	file (GLOB_RECURSE prj_manifestFiles ${prj_root}/*.mf)
	
	# Convert variable to PARENT_SCOPE
	# Detect variable is PARENT_SCOPE?
	set(prj_root ${prj_root} PARENT_SCOPE)
	set(common_includeRoot ${common_includeRoot} PARENT_SCOPE)
	set(prj_includeRoot ${prj_includeRoot} PARENT_SCOPE)
	set(common_interfaceRoot ${common_interfaceRoot} PARENT_SCOPE)
	set(prj_interfaceRoot ${prj_interfaceRoot} PARENT_SCOPE)
	
	set(prj_includeFiles ${prj_includeFiles} PARENT_SCOPE)
	set(prj_interfaceFiles ${prj_interfaceFiles} PARENT_SCOPE)
	set(prj_headerFiles ${prj_headerFiles} PARENT_SCOPE)
	set(prj_srcFiles ${prj_srcFiles} PARENT_SCOPE)
	set(prj_uiFiles ${prj_uiFiles} PARENT_SCOPE)
	set(prj_transitionFiles ${prj_transitionFiles} PARENT_SCOPE)
	set(prj_resourceFiles ${prj_resourceFiles} PARENT_SCOPE)
	set(prj_manifestFiles ${prj_manifestFiles} PARENT_SCOPE)
	
	# Source group
	if (keep_source_group_tree STREQUAL "ON")
		source_group(TREE ${common_includeRoot}/.. FILES ${prj_includeFiles})
		source_group(TREE ${common_interfaceRoot}/.. FILES ${prj_interfaceFiles})
		source_group(TREE ${prj_root}/.. FILES ${prj_headerFiles})
		source_group(TREE ${prj_root}/.. FILES ${prj_srcFiles})
		source_group(TREE ${prj_root}/.. FILES ${prj_uiFiles})
		source_group(TREE ${prj_root}/.. FILES ${prj_transitionFiles})
		source_group(TREE ${prj_root}/.. FILES ${prj_resourceFiles})
		source_group(TREE ${prj_root}/.. FILES ${prj_manifestFiles})
	else ()
		source_group ("include/${PROJECT_NAME}" FILES ${prj_includeFiles})
		source_group ("interface/${PROJECT_NAME}" FILES ${prj_interfaceFiles})
		source_group ("Header Files" FILES ${prj_headerFiles})
		source_group ("Source Files" FILES ${prj_srcFiles})
		source_group ("Form Files" FILES ${prj_uiFiles})
		source_group ("Translation Files" FILES ${prj_transitionFiles})
		source_group ("Resource files" FILES ${prj_resourceFiles})
		source_group ("Manifest files" FILES ${prj_manifestFiles})
	endif ()
endfunction()
