
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

RUN git clone https://github.com/riken-RCSS/HIVE




    
