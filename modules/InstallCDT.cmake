add_custom_command( TARGET VectrumClang POST_BUILD COMMAND mkdir -p ${CMAKE_BINARY_DIR}/bin )
macro( vectrum_clang_install file )
   set(BINARY_DIR ${CMAKE_BINARY_DIR}/vectrum_llvm/bin)
   add_custom_command( TARGET VectrumClang POST_BUILD COMMAND ${CMAKE_COMMAND} -E copy ${BINARY_DIR}/${file} ${CMAKE_BINARY_DIR}/bin/ )
   install(FILES ${BINARY_DIR}/${file}
      DESTINATION ${CDT_INSTALL_PREFIX}/bin
      PERMISSIONS OWNER_READ OWNER_EXECUTE GROUP_READ GROUP_EXECUTE WORLD_READ WORLD_EXECUTE)
endmacro( vectrum_clang_install )

macro( vectrum_clang_install_and_symlink file symlink )
   set(BINARY_DIR ${CMAKE_BINARY_DIR}/vectrum_llvm/bin)
   add_custom_command( TARGET VectrumClang POST_BUILD COMMAND ${CMAKE_COMMAND} -E copy ${BINARY_DIR}/${file} ${CMAKE_BINARY_DIR}/bin/ )
   add_custom_command( TARGET VectrumClang POST_BUILD COMMAND cd ${CMAKE_BINARY_DIR}/bin && ln -sf ${file} ${symlink} )
   install(FILES ${BINARY_DIR}/${file}
      DESTINATION ${CDT_INSTALL_PREFIX}/bin
      PERMISSIONS OWNER_READ OWNER_EXECUTE GROUP_READ GROUP_EXECUTE WORLD_READ WORLD_EXECUTE)
   install(CODE "execute_process( COMMAND ${CMAKE_COMMAND} -E make_directory ${CMAKE_INSTALL_PREFIX}/bin)")
   install(CODE "execute_process( COMMAND ${CMAKE_COMMAND} -E create_symlink ${CDT_INSTALL_PREFIX}/bin/${file} ${CMAKE_INSTALL_PREFIX}/bin/${symlink})")
endmacro( vectrum_clang_install_and_symlink )

macro( vectrum_tool_install file )
   set(BINARY_DIR ${CMAKE_BINARY_DIR}/tools/bin)
   add_custom_command( TARGET VectrumTools POST_BUILD COMMAND ${CMAKE_COMMAND} -E copy ${BINARY_DIR}/${file} ${CMAKE_BINARY_DIR}/bin/ )
   install(FILES ${BINARY_DIR}/${file}
      DESTINATION ${CDT_INSTALL_PREFIX}/bin
      PERMISSIONS OWNER_READ OWNER_EXECUTE GROUP_READ GROUP_EXECUTE WORLD_READ WORLD_EXECUTE)
endmacro( vectrum_tool_install )

macro( vectrum_tool_install_and_symlink file symlink )
   set(BINARY_DIR ${CMAKE_BINARY_DIR}/tools/bin)
   add_custom_command( TARGET VectrumTools POST_BUILD COMMAND ${CMAKE_COMMAND} -E copy ${BINARY_DIR}/${file} ${CMAKE_BINARY_DIR}/bin/ )
   install(FILES ${BINARY_DIR}/${file}
      DESTINATION ${CDT_INSTALL_PREFIX}/bin
      PERMISSIONS OWNER_READ OWNER_EXECUTE GROUP_READ GROUP_EXECUTE WORLD_READ WORLD_EXECUTE)
   install(CODE "execute_process( COMMAND ${CMAKE_COMMAND} -E make_directory ${CMAKE_INSTALL_PREFIX}/bin)")
   install(CODE "execute_process( COMMAND ${CMAKE_COMMAND} -E create_symlink ${CDT_INSTALL_PREFIX}/bin/${file} ${CMAKE_INSTALL_PREFIX}/bin/${symlink})")
endmacro( vectrum_tool_install_and_symlink )

macro( vectrum_cmake_install_and_symlink file symlink )
   set(BINARY_DIR ${CMAKE_BINARY_DIR}/modules)
   install(CODE "execute_process( COMMAND ${CMAKE_COMMAND} -E make_directory ${CMAKE_INSTALL_PREFIX}/lib/cmake/vectrum.cdt)")
   install(CODE "execute_process( COMMAND ${CMAKE_COMMAND} -E create_symlink ${CDT_INSTALL_PREFIX}/lib/cmake/vectrum.cdt/${file} ${CMAKE_INSTALL_PREFIX}/lib/cmake/vectrum.cdt/${symlink})")
endmacro( vectrum_cmake_install_and_symlink )

macro( vectrum_libraries_install)
   execute_process(COMMAND ${CMAKE_COMMAND} -E make_directory ${CMAKE_BINARY_DIR}/lib)
   execute_process(COMMAND ${CMAKE_COMMAND} -E make_directory ${CMAKE_BINARY_DIR}/include)
   install(DIRECTORY ${CMAKE_BINARY_DIR}/lib/ DESTINATION ${CDT_INSTALL_PREFIX}/lib)
   install(DIRECTORY ${CMAKE_BINARY_DIR}/include/ DESTINATION ${CDT_INSTALL_PREFIX}/include)
endmacro( vectrum_libraries_install )

vectrum_clang_install_and_symlink(llvm-ranlib vectrum-ranlib)
vectrum_clang_install_and_symlink(llvm-ar vectrum-ar)
vectrum_clang_install_and_symlink(llvm-nm vectrum-nm)
vectrum_clang_install_and_symlink(llvm-objcopy vectrum-objcopy)
vectrum_clang_install_and_symlink(llvm-objdump vectrum-objdump)
vectrum_clang_install_and_symlink(llvm-readobj vectrum-readobj)
vectrum_clang_install_and_symlink(llvm-readelf vectrum-readelf)
vectrum_clang_install_and_symlink(llvm-strip vectrum-strip)

vectrum_clang_install(opt)
vectrum_clang_install(llc)
vectrum_clang_install(lld)
vectrum_clang_install(ld.lld)
vectrum_clang_install(ld64.lld)
vectrum_clang_install(clang-7)
vectrum_clang_install(wasm-ld)

vectrum_tool_install_and_symlink(vectrum-pp vectrum-pp)
vectrum_tool_install_and_symlink(vectrum-wast2wasm vectrum-wast2wasm)
vectrum_tool_install_and_symlink(vectrum-wasm2wast vectrum-wasm2wast)
vectrum_tool_install_and_symlink(vectrum-cc vectrum-cc)
vectrum_tool_install_and_symlink(vectrum-cpp vectrum-cpp)
vectrum_tool_install_and_symlink(vectrum-ld vectrum-ld)
vectrum_tool_install_and_symlink(vectrum-abigen vectrum-abigen)
vectrum_tool_install_and_symlink(vectrum-abidiff vectrum-abidiff)
vectrum_tool_install_and_symlink(vectrum-init vectrum-init)

vectrum_clang_install(../lib/LLVMVectrumApply${CMAKE_SHARED_LIBRARY_SUFFIX})
vectrum_clang_install(../lib/LLVMVectrumSoftfloat${CMAKE_SHARED_LIBRARY_SUFFIX})
vectrum_clang_install(../lib/vectrum_plugin${CMAKE_SHARED_LIBRARY_SUFFIX})

vectrum_cmake_install_and_symlink(vectrum.cdt-config.cmake vectrum.cdt-config.cmake)
vectrum_cmake_install_and_symlink(VectrumWasmToolchain.cmake VectrumWasmToolchain.cmake)
vectrum_cmake_install_and_symlink(VectrumCDTMacros.cmake VectrumCDTMacros.cmake)

vectrum_libraries_install()
