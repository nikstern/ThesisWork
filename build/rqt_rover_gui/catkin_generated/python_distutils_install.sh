#!/bin/sh

if [ -n "$DESTDIR" ] ; then
    case $DESTDIR in
        /*) # ok
            ;;
        *)
            /bin/echo "DESTDIR argument must be absolute... "
            /bin/echo "otherwise python's distutils will bork things."
            exit 1
    esac
    DESTDIR_ARG="--root=$DESTDIR"
fi

echo_and_run() { echo "+ $@" ; "$@" ; }

echo_and_run cd "/home/administrator/Swarmathon2016/src/rqt_rover_gui"

# snsure that Python install destination exists
echo_and_run mkdir -p "$DESTDIR/home/administrator/Swarmathon2016/install/lib/python2.7/dist-packages"

# Note that PYTHONPATH is pulled from the environment to support installing
# into one location when some dependencies were installed in another
# location, #123.
echo_and_run /usr/bin/env \
    PYTHONPATH="/home/administrator/Swarmathon2016/install/lib/python2.7/dist-packages:/home/administrator/Swarmathon2016/build/rqt_rover_gui/lib/python2.7/dist-packages:$PYTHONPATH" \
    CATKIN_BINARY_DIR="/home/administrator/Swarmathon2016/build/rqt_rover_gui" \
    "/usr/bin/python" \
    "/home/administrator/Swarmathon2016/src/rqt_rover_gui/setup.py" \
    build --build-base "/home/administrator/Swarmathon2016/build/rqt_rover_gui" \
    install \
    $DESTDIR_ARG \
    --install-layout=deb --prefix="/home/administrator/Swarmathon2016/install" --install-scripts="/home/administrator/Swarmathon2016/install/bin"
