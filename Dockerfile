
FROM ubuntu:16.04

RUN echo "now building..."

RUN apt-get update && apt-get install -y \
    git \
    g++ \
    gfortran \
    libopenmpi-dev \
    autoconf \
    cmake \
    libnetcdf* \
    freeglut3 \
    freeglut3-dev \
    libglew-dev \
    npm

RUN git clone -b KVSHiveModule https://github.com/riken-RCCS/HIVE
RUN cd HIVE && git submodule update --init

RUN cd HIVE && mkdir build

RUN cd HIVE && ./scripts/build_loader_libs_linux-x64.sh

RUN cd HIVE && ./scripts/cmake_linux-x64.sh

RUN cd HIVE/build && make -j8







    
