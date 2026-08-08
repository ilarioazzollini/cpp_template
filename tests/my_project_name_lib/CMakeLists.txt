set(TEST_NAME test_my_project_name_lib)

add_executable(${TEST_NAME})

target_compile_features(${TEST_NAME} PRIVATE cxx_std_23)

# CPP FILES
file(GLOB_RECURSE CPP_FILES CONFIGURE_DEPENDS
    ${CMAKE_CURRENT_SOURCE_DIR}/src/*.cpp
)

message(STATUS "Test files found: ${CPP_FILES}")

target_sources(${TEST_NAME}
    PRIVATE
    ${CPP_FILES}
)

target_link_libraries(${TEST_NAME}
    PRIVATE
    GTest::gtest_main
    my_project_name::my_project_name_lib
)

gtest_discover_tests(${TEST_NAME})
