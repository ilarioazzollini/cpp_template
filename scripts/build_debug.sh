cd /root/my_project_name
export buildFolderName=build_gnu_debug
rm compile_commands.json
cmake -S . \
    -G "Ninja" \
    -B ${buildFolderName} \
    -D CMAKE_C_COMPILER=gcc \
    -D CMAKE_CXX_COMPILER=g++ \
    -D CMAKE_BUILD_TYPE=Debug \
    -D BUILD_TESTING=ON \
    --log-context
ln -s ${PWD}/${buildFolderName}/compile_commands.json ${PWD}/compile_commands.json
cmake --build ${buildFolderName} --config Debug -j 12
