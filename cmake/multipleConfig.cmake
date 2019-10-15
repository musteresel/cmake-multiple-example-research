get_filename_component(MYDIR "${CMAKE_CURRENT_LIST_FILE}" PATH)

if (NOT TARGET multiple::lib)
  include("${MYDIR}/multipleTargets.cmake")
endif ()

