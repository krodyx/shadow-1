# - Check for the presence of LLVM
#
# The following variables are set when LLVM is found:
#  HAVE_LLVM       = Set to true, if all components of LLVM
#                          have been found.
#  LLVM_DIR   = The directory containing LLVM-Config.cmake

## -----------------------------------------------------------------------------
## Check for the files

find_path (LLVM_DIR LLVM-Config.cmake
  PATHS ${CMAKE_EXTRA_INCLUDES} PATH_SUFFIXES cmake NO_DEFAULT_PATH
  )

if(NOT LLVM_DIR)
  find_path (LLVM_DIR LLVM-Config.cmake
    PATHS /usr/local/share/llvm /usr/share/llvm /usr/share/llvm-3.5 /usr/share/llvm-3.4 /usr/share/llvm-3.3 /usr/share/llvm-3.2 PATH_SUFFIXES cmake
  )
endif()

## -----------------------------------------------------------------------------
## Actions taken when all components have been found

if (LLVM_DIR)
  set (HAVE_LLVM TRUE)
  #GET_FILENAME_COMPONENT(LLVM_DIR "${LLVM_CONF}" PATH) # gets parent dir
  if (NOT LLVM_FIND_QUIETLY)
    message (STATUS "Found components for LLVM")
    message (STATUS "LLVM_DIR = ${LLVM_DIR}")
  endif ()
else ()
  if (LLVM_FIND_REQUIRED)
    message (FATAL_ERROR "Unable to find path to LLVM Config file LLVM-Config.cmake")
  endif ()
endif ()

mark_as_advanced (
  HAVE_LLVM
  LLVM_DIR
  )
