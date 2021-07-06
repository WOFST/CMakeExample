project(SampleTest)

fetch_project_source_files()

add_executable (${PROJECT_NAME}
	${prj_headerFiles} 
	${prj_srcFiles})
use_group_folder()

# does the application run
add_test(NAME Runs COMMAND ${PROJECT_NAME} 25)

# define a function to simplify adding tests
function(do_test target arg result)
  add_test(NAME Comp${arg} COMMAND ${target} ${arg})
  set_tests_properties(Comp${arg}
    PROPERTIES PASS_REGULAR_EXPRESSION ${result}
    )
endfunction(do_test)

# do a bunch of result based tests
do_test(${PROJECT_NAME} 4 "4 is 2")
do_test(${PROJECT_NAME} 9 "9 is 4")
do_test(${PROJECT_NAME} 5 "5 is 2")
do_test(${PROJECT_NAME} 7 "7 is 3")
do_test(${PROJECT_NAME} 25 "25 is 12")