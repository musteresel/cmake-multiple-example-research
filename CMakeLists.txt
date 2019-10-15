set(CMAKE_TRY_COMPILE_TARGET_TYPE STATIC_LIBRARY)
project(multiple C)
add_library(lib STATIC)
target_sources(lib PRIVATE main.c)
if (LIB_TARGET STREQUAL "x86")
  enable_language(ASM)
  target_sources(lib PRIVATE x86/start.s x86/text.c)
  # set_target_properties(lib PROPERTIES LINK_DEPENDS ${CMAKE_SOURCE_DIR}/x86/link.ld)
  target_link_options(lib INTERFACE -nostartfiles
    $<BUILD_INTERFACE: -T x86/link.ld>)
    # $<INSTALL_INTERFACE: -T share/lib/x86/link.ld>)
  install(FILES x86/link.ld
    DESTINATION share/multiple/x86)
  install(FILES x86/multipleTargets-x86.cmake
    DESTINATION lib/cmake/multiple)
elseif (LIB_TARGET STREQUAL "hosted")
  target_sources(lib PRIVATE hosted/boot.c)
else ()
  message(FATAL_ERROR "No LIB_TARGET specified")
endif ()

install(TARGETS lib
  EXPORT multiple-targets
  ARCHIVE DESTINATION lib/multiple)

install(EXPORT multiple-targets
  FILE multipleTargets.cmake
  NAMESPACE multiple::
  DESTINATION lib/cmake/multiple)

install(FILES cmake/multipleConfig.cmake
  DESTINATION lib/cmake/multiple)
