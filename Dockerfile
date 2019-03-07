
FROM ubuntu:18.04

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
    libglu1-mesa-dev \
    mesa-common-dev \
    libxmu-dev \
    libxi-dev \
    nodejs \
    curl \
    npm


RUN cd var && git clone -b KVSHiveModule https://github.com/riken-RCCS/HIVE

RUN npm cache clean
RUN npm install -g n
RUN n stable
RUN npm update -g npm

WORKDIR /var/HIVE/
RUN git submodule update --init
RUN mkdir build
RUN ./scripts/build_nanomsg.sh

#special
WORKDIR /var/HIVE/third_party
RUN rm -rf KVS
RUN git clone -b develop https://github.com/kioku-systemk/KVS.git

WORKDIR /var/HIVE/build
RUN cmake ..
RUN make -j8

WORKDIR /var/HIVE/build/bin/ModuleSystem
EXPOSE 8080
RUN sh install.sh

CMD ["node", "server.js", "80"]






    
