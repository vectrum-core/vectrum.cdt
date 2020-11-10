include(ExternalProject)
# if no cdt root is given use default path
if(VECTRUM_CDT_ROOT STREQUAL "" OR NOT VECTRUM_CDT_ROOT)
   find_package(vectrum.cdt)
endif()

ExternalProject_Add(
   send_inline_project
   SOURCE_DIR ${CMAKE_SOURCE_DIR}/src
   BINARY_DIR ${CMAKE_BINARY_DIR}/send_inline
   CMAKE_ARGS -DCMAKE_TOOLCHAIN_FILE=${VECTRUM_CDT_ROOT}/lib/cmake/vectrum.cdt/VectrumWasmToolchain.cmake
   UPDATE_COMMAND ""
   PATCH_COMMAND ""
   TEST_COMMAND ""
   INSTALL_COMMAND ""
   BUILD_ALWAYS 1
)