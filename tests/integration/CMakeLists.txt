cmake_minimum_required( VERSION 3.5 )

set(VECTRUM_VERSION_MIN "0.1")
set(VECTRUM_VERSION_SOFT_MAX "0.1")
#set(VECTRUM_VERSION_HARD_MAX "")

find_package(vectrum)

### Check the version of VECTRUM
set(VERSION_MATCH_ERROR_MSG "")
VECTRUM_CHECK_VERSION(VERSION_OUTPUT "${VECTRUM_VERSION}"
                                   "${VECTRUM_VERSION_MIN}"
                                   "${VECTRUM_VERSION_SOFT_MAX}"
                                   "${VECTRUM_VERSION_HARD_MAX}"
                                   VERSION_MATCH_ERROR_MSG)
if(VERSION_OUTPUT STREQUAL "MATCH")
   message(STATUS "Using VECTRUM version ${VECTRUM_VERSION}")
elseif(VERSION_OUTPUT STREQUAL "WARN")
   message(WARNING "Using VECTRUM version ${VECTRUM_VERSION} even though it exceeds the maximum supported version of ${VECTRUM_VERSION_SOFT_MAX}; continuing with configuration, however build may fail.\nIt is recommended to use VECTRUM version ${VECTRUM_VERSION_SOFT_MAX}.x")
else() # INVALID OR MISMATCH
   message(FATAL_ERROR "Found VECTRUM version ${VECTRUM_VERSION} but it does not satisfy version requirements: ${VERSION_MATCH_ERROR_MSG}\nPlease use VECTRUM version ${VECTRUM_VERSION_SOFT_MAX}.x")
endif(VERSION_OUTPUT STREQUAL "MATCH")


enable_testing()

configure_file(${CMAKE_SOURCE_DIR}/contracts.hpp.in ${CMAKE_BINARY_DIR}/contracts.hpp)

include_directories(${CMAKE_BINARY_DIR})

file(GLOB INT_TESTS "*.cpp" "*.hpp")

add_vectrum_test( integration_tests ${INT_TESTS} )
