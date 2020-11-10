configure_file(${CMAKE_CURRENT_SOURCE_DIR}/eosio-cc.cpp.in ${CMAKE_BINARY_DIR}/vectrum-cc.cpp)

configure_file(${CMAKE_CURRENT_SOURCE_DIR}/eosio-cpp.cpp.in ${CMAKE_BINARY_DIR}/vectrum-cpp.cpp)

add_tool(vectrum-cc)
add_tool(vectrum-cpp)
