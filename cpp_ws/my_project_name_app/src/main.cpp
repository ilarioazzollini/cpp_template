#include <iostream>
#include <print>

#include "my_project_name_app/utilities.hpp"
#include "my_project_name_lib/greetings.hpp"

int main() {
    std::cout << utilities::get_current_utc_datetime_str() << " "
              << my_project_name_lib::hello_world() << std::endl;

    std::println("Hello!");

    return 0;
}
