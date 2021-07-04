mkdir build
cd build
rem del CMakeCache.txt
	
cmake -Dkeep_source_group_tree=ON -G "Visual Studio 15 2017 Win64" ..
if %errorlevel% == 1 (
	pause
) else (
	rem todo Nothing
)