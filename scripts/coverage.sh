cd /root/my_project_name
export buildFolderName=build_gnu_coverage
rm -rf ${buildFolderName} coverage
cmake -S . \
    -G "Ninja" \
    -B ${buildFolderName} \
    -D CMAKE_C_COMPILER=gcc \
    -D CMAKE_CXX_COMPILER=g++ \
    -D CMAKE_BUILD_TYPE=Debug \
    -D BUILD_TESTING=ON \
    -D CMAKE_CXX_FLAGS="--coverage -O0 -g" \
    -D CMAKE_EXE_LINKER_FLAGS="--coverage" \
    --log-context
cmake --build ${buildFolderName} --config Debug -j 12
GTEST_COLOR=1 ctest --test-dir ${buildFolderName} \
    --output-on-failure \
    --stop-on-failure
mkdir -p coverage
gcovr --root . \
    --filter "cpp_ws/my_project_name_lib/" \
    --fail-under-line 80 \
    --print-summary \
    --html-details coverage/index.html
echo "Coverage report at /root/my_project_name/coverage/index.html"
