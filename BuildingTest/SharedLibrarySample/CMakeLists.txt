project(SharedLibrarySample)

fetch_project_source_files()

add_library(${PROJECT_NAME} SHARED 
	${prj_includeFiles} 
	${prj_interfaceFiles} 
	${prj_headerFiles} 
	${prj_srcFiles}
	)
use_group_folder()

# target include directories and install 
target_include_directories(${PROJECT_NAME}
	PRIVATE
	${prj_root}
	PUBLIC
	$<BUILD_INTERFACE:${common_includeRoot}> $<INSTALL_INTERFACE:include>
	$<BUILD_INTERFACE:${common_interfaceRoot}> $<INSTALL_INTERFACE:interface>
)

IF(EXISTS ${prj_includeRoot})
	target_include_directories(${PROJECT_NAME}
		PUBLIC
		$<BUILD_INTERFACE:${prj_includeRoot}> $<INSTALL_INTERFACE:include/${PROJECT_NAME}>
	)
ENDIF()

IF(EXISTS ${prj_interfaceRoot})
	target_include_directories(${PROJECT_NAME}
		PUBLIC
		$<BUILD_INTERFACE:${prj_interfaceRoot}> $<INSTALL_INTERFACE:interface/${PROJECT_NAME}>
	)
ENDIF()

# install include and interface
install(FILES ${prj_includeFiles} DESTINATION include/${PROJECT_NAME})
install(FILES ${prj_interfaceFiles} DESTINATION interface/${PROJECT_NAME})

# install runtime files
install(TARGETS ${PROJECT_NAME} 
	EXPORT SharedLibrarySampleTargets
	LIBRARY
	DESTINATION lib)

# export and install cmake module 
export(EXPORT SharedLibrarySampleTargets
  FILE ${CMAKE_CURRENT_BINARY_DIR}/SharedLibrarySampleTargets.cmake
)
install(EXPORT SharedLibrarySampleTargets
   FILE SharedLibrarySampleTargets.cmake
   DESTINATION lib/cmake/CMakeExample
)