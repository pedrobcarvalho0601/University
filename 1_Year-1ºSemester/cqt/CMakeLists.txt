cmake_minimum_required(VERSION 3.5)

project(cqt LANGUAGES C)

add_executable(cqt main.c)

include(GNUInstallDirs)
install(TARGETS cqt
    LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR}
    RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR}
)
