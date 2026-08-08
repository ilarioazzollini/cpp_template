cd /root/my_project_name
export buildFolderName=build_gnu_release
export installFolderName=install_gnu_release
rm -rf ${buildFolderName} ${installFolderName} compile_commands.json
cmake -S . \
    -G "Ninja" \
    -B ${buildFolderName} \
    -D CMAKE_C_COMPILER=gcc \
    -D CMAKE_CXX_COMPILER=g++ \
    -D CMAKE_BUILD_TYPE=Release \
    -D BUILD_TESTING=ON \
    --log-context
ln -s ${PWD}/${buildFolderName}/compile_commands.json ${PWD}/compile_commands.json
cmake --build ${buildFolderName} --config Release -j 12
cmake --install ${buildFolderName} --prefix ${PWD}/${installFolderName}
GTEST_COLOR=1 ctest --test-dir ${buildFolderName} \
    --build-config Release \
    --verbose \
    --output-on-failure \
    --stop-on-failure
