enable_testing()

# GOOGLE TEST
include(FetchContent)
include(GoogleTest)

FetchContent_Declare(googletest
    GIT_REPOSITORY https://github.com/google/googletest
    GIT_TAG v1.17.0
    FIND_PACKAGE_ARGS NAMES GTest
)
FetchContent_MakeAvailable(googletest)

# TESTS
add_subdirectory(my_project_name_lib)
