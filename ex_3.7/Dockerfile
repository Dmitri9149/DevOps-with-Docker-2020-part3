FROM ubuntu:16.04 as origin
WORKDIR /home/join/JoCaml_files
RUN ln -sf /bin/bash /bin/sh && \
    apt-get update && \
    apt-get install -y apt-utils libpthread-stubs0-dev wget build-essential && \
    wget http://jocaml.inria.fr/pub/distri/jocaml-4.01/jocaml-4.01.0.tar.gz && \
    tar -xf jocaml-4.01.0.tar.gz && \
    rm /home/join/JoCaml_files/jocaml-4.01.0.tar.gz && \
    apt-get autoremove --purge -y wget 
WORKDIR /home/join/JoCaml_files/jocaml-4.01.0
RUN ./configure && \
    make world && \
    make bootstrap && \
    make opt && \
    make opt.opt && \
    umask 022 && \
    make install && \
    make clean


FROM ubuntu:16.04
COPY --from=origin /usr/. /usr/
## COPY --from=origin /sbin/. /sbin/
## COPY --from=origin /bin/. /bin/
WORKDIR /home/join
RUN apt-get update && apt-get install -y vim && \
    addgroup --system group && \
    adduser --disabled-password --system join  && \
    adduser join group && \
    chown --recursive join:group /home/join

USER join
CMD ["/bin/bash"]