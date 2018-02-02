execute_process(COMMAND "/home/administrator/Swarmathon2016/build/rqt_rover_gui/catkin_generated/python_distutils_install.sh" RESULT_VARIABLE res)

if(NOT res EQUAL 0)
  message(FATAL_ERROR "execute_process(/home/administrator/Swarmathon2016/build/rqt_rover_gui/catkin_generated/python_distutils_install.sh) returned error code ")
endif()
