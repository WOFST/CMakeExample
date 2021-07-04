# name: use_group_folder
# param: 
# param with parent: ${group_folder}、${PROJECT_NAME}
function(use_group_folder)
	set_target_properties (${PROJECT_NAME} PROPERTIES FOLDER "${group_folder}")
endfunction()