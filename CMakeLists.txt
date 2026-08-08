cmake_minimum_required(VERSION 3.22)

list(APPEND CMAKE_MESSAGE_CONTEXT "my_project_name")

project(my_project_name
    VERSION 0.1.0
    DESCRIPTION "my_project_name"
    LANGUAGES CXX
)

if(PROJECT_IS_TOP_LEVEL)
    set(CMAKE_CXX_STANDARD 23)
    set(CMAKE_CXX_STANDARD_REQUIRED ON)
    set(CMAKE_CXX_EXTENSIONS OFF)
    add_compile_options(-fdiagnostics-color=always)
    set(CMAKE_EXPORT_COMPILE_COMMANDS ON)
endif()

include(GNUInstallDirs)

# BUILD TYPE
if(NOT CMAKE_BUILD_TYPE)
    set(CMAKE_BUILD_TYPE Release CACHE STRING "" FORCE)
endif()

# CLANG FORMAT
if(PROJECT_IS_TOP_LEVEL)
    set(WORKSPACE ${CMAKE_CURRENT_SOURCE_DIR}/cpp_ws/*)

    file(GLOB_RECURSE ALL_PROJECT_FILES CONFIGURE_DEPENDS
        ${WORKSPACE}/*.cpp
        ${WORKSPACE}/*.h
        ${WORKSPACE}/*.hpp
    )

    list(REMOVE_DUPLICATES ALL_PROJECT_FILES)

    message(STATUS "Project files: ${ALL_PROJECT_FILES}")

    find_program(CLANG_FORMAT_EXE NAMES "clang-format" REQUIRED)
    if(CLANG_FORMAT_EXE)
        add_custom_target(format
            ALL
            COMMAND ${CLANG_FORMAT_EXE} -i ${ALL_PROJECT_FILES}
            COMMENT "Formatting source files with clang-format"
        )
    endif()
endif()

# CLANG TIDY
if(PROJECT_IS_TOP_LEVEL)
    find_program(CLANG_TIDY_EXE NAMES "clang-tidy" REQUIRED)
    if(CLANG_TIDY_EXE)
        set(CMAKE_CXX_CLANG_TIDY ${CLANG_TIDY_EXE} -p ${CMAKE_BINARY_DIR})
    endif()
endif()


# LIBRARIES AND/OR EXECUTABLES
add_subdirectory(cpp_ws)


# TESTING
include(CTest)
if(BUILD_TESTING)
    add_subdirectory(tests)
endif()
