cmake_minimum_required(VERSION 3.22)

project(fmt-example)

add_executable(main main.cc format.cc)

target_compile_features(main PRIVATE cxx_std_20)

target_compile_options(main PRIVATE
  "-Wall;-Wextra;-Wpedantic"
)
