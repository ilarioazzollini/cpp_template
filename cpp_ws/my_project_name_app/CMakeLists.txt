set(EXECUTABLE_NAME my_project_name_app)

list(APPEND CMAKE_MESSAGE_CONTEXT ${EXECUTABLE_NAME})

add_executable(${EXECUTABLE_NAME})

set_target_properties(${EXECUTABLE_NAME}
    PROPERTIES
        OUTPUT_NAME ${PROJECT_NAME}_${EXECUTABLE_NAME}
)

target_compile_features(${EXECUTABLE_NAME} PUBLIC cxx_std_23)

#HEADER FILES
file(GLOB_RECURSE HEADER_FILES CONFIGURE_DEPENDS
    ${CMAKE_CURRENT_SOURCE_DIR}/include/${EXECUTABLE_NAME}/*.h
    ${CMAKE_CURRENT_SOURCE_DIR}/include/${EXECUTABLE_NAME}/*.hpp
)
# message(STATUS "Header files found:")
# foreach(file in LISTS HEADER_FILES)
#     message(STATUS "\t- ${file}")
# endforeach()

# CPP FILES
file(GLOB_RECURSE CPP_FILES CONFIGURE_DEPENDS
    ${CMAKE_CURRENT_SOURCE_DIR}/src/*.cpp
)
# message(STATUS "Cpp files found:")
# foreach(file in LISTS CPP_FILES)
#     message(STATUS "\t- ${file}")
# endforeach()

target_sources(${EXECUTABLE_NAME}
    PRIVATE
        ${CPP_FILES}
    PRIVATE FILE_SET HEADERS
        BASE_DIRS include
        FILES ${HEADER_FILES}
)

target_link_libraries(${EXECUTABLE_NAME}
    PUBLIC
        my_project_name::my_project_name_lib
)

# INSTALLATION
install(
    TARGETS ${EXECUTABLE_NAME}
)