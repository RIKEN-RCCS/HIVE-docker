
FROM nvidia/opengl:1.0-glvnd-runtime-ubuntu18.04
ENV NVIDIA_DRIVER_CAPABILITIES ${NVIDIA_DRIVER_CAPABILITIES},display

# nvidia-container-runtime
ENV NVIDIA_VISIBLE_DEVICES ${NVIDIA_VISIBLE_DEVICES:-all}
ENV NVIDIA_DRIVER_CAPABILITIES ${NVIDIA_DRIVER_CAPABILITIES:+$NVIDIA_DRIVER_CAPABILITIES,}graphics

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
    libhdf5-serial-dev \
    mesa-common-dev \
    libxmu-dev \
    libxi-dev \
    nodejs \
    curl \
    npm

RUN echo "clone HIVE..."

RUN cd var && git clone -b KVSHiveModule https://github.com/riken-RCCS/HIVE

RUN npm cache clean
RUN npm install -g n
RUN n stable
RUN npm update -g npm

WORKDIR /var/HIVE/
RUN git submodule update --init
RUN mkdir build
RUN ./scripts/build_nanomsg.sh

WORKDIR /var/HIVE/build
RUN cmake ..
RUN make -j8

WORKDIR /var/HIVE/build/bin/ModuleSystem
EXPOSE 8080
RUN sh install.sh

CMD ["node", "server.js", "80"]






    
