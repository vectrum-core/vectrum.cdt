configure_file(${CMAKE_CURRENT_SOURCE_DIR}/eosio-init.cpp ${CMAKE_BINARY_DIR}/vectrum-init.cpp @ONLY)

add_tool(vectrum-init)
