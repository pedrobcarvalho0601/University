cmake_minimum_required(VERSION 3.5)

project(ctesteqt LANGUAGES C)

add_executable(ctesteqt main.c)

include(GNUInstallDirs)
install(TARGETS ctesteqt
    LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR}
    RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR}
)
