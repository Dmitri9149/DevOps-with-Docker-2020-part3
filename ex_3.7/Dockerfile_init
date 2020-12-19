FROM ubuntu:16.04
RUN ln -sf /bin/bash /bin/sh
RUN useradd -ms /bin/bash  join
WORKDIR /home/join/JoCaml_files
RUN apt-get update && apt-get install -y apt-utils
RUN apt-get update && apt-get install -y libpthread-stubs0-dev
RUN apt-get update && apt-get install -y wget
RUN wget http://jocaml.inria.fr/pub/distri/jocaml-4.01/jocaml-4.01.0.tar.gz
RUN  tar -xf jocaml-4.01.0.tar.gz 
WORKDIR /home/join/JoCaml_files/jocaml-4.01.0
RUN ls
RUN apt-get update && apt-get install build-essential -y
RUN gcc --version
RUN ./configure
RUN make world
RUN make bootstrap
RUN make opt
RUN make opt.opt
RUN umask 022
RUN make install
RUN make clean
