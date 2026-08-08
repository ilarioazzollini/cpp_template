#include "my_project_name_app/utilities.hpp"

#include <chrono>

namespace utilities {

    std::string get_current_utc_datetime_str() {
        using namespace std::chrono_literals;
        auto now = std::chrono::system_clock::now();
        auto now_milliseconds =
            std::chrono::time_point_cast<std::chrono::milliseconds>(now);
        std::string now_str =
            std::format("{:%Y/%m/%d %H:%M:%S}", now_milliseconds);
        now_str = "[UTC " + now_str + "]";
        return now_str;
    }
}  // namespace utilities
