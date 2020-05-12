# generated from genmsg/cmake/pkg-genmsg.cmake.em

message(STATUS "assignment_1: 2 messages, 0 services")

set(MSG_I_FLAGS "-Iassignment_1:/home/rishab/Documents/CS726A1/src/assignment_1/msg;-Istd_msgs:/opt/ros/melodic/share/std_msgs/cmake/../msg")

# Find all generators
find_package(gencpp REQUIRED)
find_package(geneus REQUIRED)
find_package(genlisp REQUIRED)
find_package(gennodejs REQUIRED)
find_package(genpy REQUIRED)

add_custom_target(assignment_1_generate_messages ALL)

# verify that message/service dependencies have not changed since configure



get_filename_component(_filename "/home/rishab/Documents/CS726A1/src/assignment_1/msg/laser.msg" NAME_WE)
add_custom_target(_assignment_1_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "assignment_1" "/home/rishab/Documents/CS726A1/src/assignment_1/msg/laser.msg" ""
)

get_filename_component(_filename "/home/rishab/Documents/CS726A1/src/assignment_1/msg/bumper.msg" NAME_WE)
add_custom_target(_assignment_1_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "assignment_1" "/home/rishab/Documents/CS726A1/src/assignment_1/msg/bumper.msg" ""
)

#
#  langs = gencpp;geneus;genlisp;gennodejs;genpy
#

### Section generating for lang: gencpp
### Generating Messages
_generate_msg_cpp(assignment_1
  "/home/rishab/Documents/CS726A1/src/assignment_1/msg/laser.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/assignment_1
)
_generate_msg_cpp(assignment_1
  "/home/rishab/Documents/CS726A1/src/assignment_1/msg/bumper.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/assignment_1
)

### Generating Services

### Generating Module File
_generate_module_cpp(assignment_1
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/assignment_1
  "${ALL_GEN_OUTPUT_FILES_cpp}"
)

add_custom_target(assignment_1_generate_messages_cpp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_cpp}
)
add_dependencies(assignment_1_generate_messages assignment_1_generate_messages_cpp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/rishab/Documents/CS726A1/src/assignment_1/msg/laser.msg" NAME_WE)
add_dependencies(assignment_1_generate_messages_cpp _assignment_1_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/rishab/Documents/CS726A1/src/assignment_1/msg/bumper.msg" NAME_WE)
add_dependencies(assignment_1_generate_messages_cpp _assignment_1_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(assignment_1_gencpp)
add_dependencies(assignment_1_gencpp assignment_1_generate_messages_cpp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS assignment_1_generate_messages_cpp)

### Section generating for lang: geneus
### Generating Messages
_generate_msg_eus(assignment_1
  "/home/rishab/Documents/CS726A1/src/assignment_1/msg/laser.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/assignment_1
)
_generate_msg_eus(assignment_1
  "/home/rishab/Documents/CS726A1/src/assignment_1/msg/bumper.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/assignment_1
)

### Generating Services

### Generating Module File
_generate_module_eus(assignment_1
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/assignment_1
  "${ALL_GEN_OUTPUT_FILES_eus}"
)

add_custom_target(assignment_1_generate_messages_eus
  DEPENDS ${ALL_GEN_OUTPUT_FILES_eus}
)
add_dependencies(assignment_1_generate_messages assignment_1_generate_messages_eus)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/rishab/Documents/CS726A1/src/assignment_1/msg/laser.msg" NAME_WE)
add_dependencies(assignment_1_generate_messages_eus _assignment_1_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/rishab/Documents/CS726A1/src/assignment_1/msg/bumper.msg" NAME_WE)
add_dependencies(assignment_1_generate_messages_eus _assignment_1_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(assignment_1_geneus)
add_dependencies(assignment_1_geneus assignment_1_generate_messages_eus)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS assignment_1_generate_messages_eus)

### Section generating for lang: genlisp
### Generating Messages
_generate_msg_lisp(assignment_1
  "/home/rishab/Documents/CS726A1/src/assignment_1/msg/laser.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/assignment_1
)
_generate_msg_lisp(assignment_1
  "/home/rishab/Documents/CS726A1/src/assignment_1/msg/bumper.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/assignment_1
)

### Generating Services

### Generating Module File
_generate_module_lisp(assignment_1
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/assignment_1
  "${ALL_GEN_OUTPUT_FILES_lisp}"
)

add_custom_target(assignment_1_generate_messages_lisp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_lisp}
)
add_dependencies(assignment_1_generate_messages assignment_1_generate_messages_lisp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/rishab/Documents/CS726A1/src/assignment_1/msg/laser.msg" NAME_WE)
add_dependencies(assignment_1_generate_messages_lisp _assignment_1_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/rishab/Documents/CS726A1/src/assignment_1/msg/bumper.msg" NAME_WE)
add_dependencies(assignment_1_generate_messages_lisp _assignment_1_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(assignment_1_genlisp)
add_dependencies(assignment_1_genlisp assignment_1_generate_messages_lisp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS assignment_1_generate_messages_lisp)

### Section generating for lang: gennodejs
### Generating Messages
_generate_msg_nodejs(assignment_1
  "/home/rishab/Documents/CS726A1/src/assignment_1/msg/laser.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/assignment_1
)
_generate_msg_nodejs(assignment_1
  "/home/rishab/Documents/CS726A1/src/assignment_1/msg/bumper.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/assignment_1
)

### Generating Services

### Generating Module File
_generate_module_nodejs(assignment_1
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/assignment_1
  "${ALL_GEN_OUTPUT_FILES_nodejs}"
)

add_custom_target(assignment_1_generate_messages_nodejs
  DEPENDS ${ALL_GEN_OUTPUT_FILES_nodejs}
)
add_dependencies(assignment_1_generate_messages assignment_1_generate_messages_nodejs)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/rishab/Documents/CS726A1/src/assignment_1/msg/laser.msg" NAME_WE)
add_dependencies(assignment_1_generate_messages_nodejs _assignment_1_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/rishab/Documents/CS726A1/src/assignment_1/msg/bumper.msg" NAME_WE)
add_dependencies(assignment_1_generate_messages_nodejs _assignment_1_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(assignment_1_gennodejs)
add_dependencies(assignment_1_gennodejs assignment_1_generate_messages_nodejs)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS assignment_1_generate_messages_nodejs)

### Section generating for lang: genpy
### Generating Messages
_generate_msg_py(assignment_1
  "/home/rishab/Documents/CS726A1/src/assignment_1/msg/laser.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/assignment_1
)
_generate_msg_py(assignment_1
  "/home/rishab/Documents/CS726A1/src/assignment_1/msg/bumper.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/assignment_1
)

### Generating Services

### Generating Module File
_generate_module_py(assignment_1
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/assignment_1
  "${ALL_GEN_OUTPUT_FILES_py}"
)

add_custom_target(assignment_1_generate_messages_py
  DEPENDS ${ALL_GEN_OUTPUT_FILES_py}
)
add_dependencies(assignment_1_generate_messages assignment_1_generate_messages_py)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/rishab/Documents/CS726A1/src/assignment_1/msg/laser.msg" NAME_WE)
add_dependencies(assignment_1_generate_messages_py _assignment_1_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/rishab/Documents/CS726A1/src/assignment_1/msg/bumper.msg" NAME_WE)
add_dependencies(assignment_1_generate_messages_py _assignment_1_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(assignment_1_genpy)
add_dependencies(assignment_1_genpy assignment_1_generate_messages_py)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS assignment_1_generate_messages_py)



if(gencpp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/assignment_1)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/assignment_1
    DESTINATION ${gencpp_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_cpp)
  add_dependencies(assignment_1_generate_messages_cpp std_msgs_generate_messages_cpp)
endif()

if(geneus_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/assignment_1)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/assignment_1
    DESTINATION ${geneus_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_eus)
  add_dependencies(assignment_1_generate_messages_eus std_msgs_generate_messages_eus)
endif()

if(genlisp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/assignment_1)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/assignment_1
    DESTINATION ${genlisp_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_lisp)
  add_dependencies(assignment_1_generate_messages_lisp std_msgs_generate_messages_lisp)
endif()

if(gennodejs_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/assignment_1)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/assignment_1
    DESTINATION ${gennodejs_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_nodejs)
  add_dependencies(assignment_1_generate_messages_nodejs std_msgs_generate_messages_nodejs)
endif()

if(genpy_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/assignment_1)
  install(CODE "execute_process(COMMAND \"/usr/bin/python2\" -m compileall \"${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/assignment_1\")")
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/assignment_1
    DESTINATION ${genpy_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_py)
  add_dependencies(assignment_1_generate_messages_py std_msgs_generate_messages_py)
endif()
