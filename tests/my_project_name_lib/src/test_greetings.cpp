#include <gtest/gtest.h>

#include "my_project_name_lib/greetings.hpp"

TEST(Greetings, HelloWorld) {
    EXPECT_EQ(my_project_name_lib::hello_world(), "Hello, World!");
}
