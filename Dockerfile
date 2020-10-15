FROM alpine as build

RUN apk add --no-cache --virtual libspatialindex-build-dependencies \
    git \
    build-base \
    cmake

ENV LSI_REVISION master
RUN git clone --depth 1 --branch ${LSI_REVISION} https://github.com/libspatialindex/libspatialindex /libspatialindex

RUN mkdir -p /libspatialindex/build
WORKDIR /libspatialindex/build

RUN cmake \
    -DCMAKE_INSTALL_PREFIX=/opt/libspatialindex \
    ..
RUN make
RUN make install

