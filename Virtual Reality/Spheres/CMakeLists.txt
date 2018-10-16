cmake_minimum_required(VERSION 3.12)
project(rt_incomplete_2)

set(CMAKE_CXX_STANDARD 14)

include_directories(.)

add_executable(rt_incomplete_2
        Color.hpp
        Geometry.hpp
        Image.hpp
        Intersection.hpp
        Light.hpp
        Line.hpp
        lodepng.cpp
        lodepng.hpp
        main.cpp
        Material.hpp
        Scene.hpp
        Sphere.cpp
        Sphere.hpp
        Vector.hpp)
