#pragma once

#include <string>

namespace my_project_name_lib {

    /**
     * Build the canonical greeting for the project.
     *
     * Returns a fixed, friendly greeting. This is intentionally trivial: it
     * exists so the template ships with one documented, tested symbol.
     *
     * @return The greeting `"Hello, World!"`.
     */
    std::string hello_world();

}  // namespace my_project_name_lib
