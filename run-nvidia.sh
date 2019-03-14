docker run --runtime=nvidia -p 8080:80 -t --rm -e DISPLAY=:1.0 -v /tmp/.X11-unix:/tmp/.X11-unix hudviz/hive-modulesystem
