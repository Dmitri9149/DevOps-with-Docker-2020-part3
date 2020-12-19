The ouput of history command for the original Dockerfile:
```
~>/Dockerized-join-calculus$ sudo docker history jocaml:latest
IMAGE          CREATED          CREATED BY                                      SIZE      COMMENT
425d34133815   6 minutes ago    /bin/sh -c make clean                           403kB     
ec0d692326d4   6 minutes ago    /bin/sh -c make install                         39.3MB    
ba30b15784d6   6 minutes ago    /bin/sh -c umask 022                            0B        
584551e6bfc7   6 minutes ago    /bin/sh -c make opt.opt                         33.2MB    
3eaeebcf4799   7 minutes ago    /bin/sh -c make opt                             17.3MB    
f8993f08efa3   7 minutes ago    /bin/sh -c make bootstrap                       54.6MB    
06e0441913b3   9 minutes ago    /bin/sh -c make world                           51.3MB    
faa877d4fd41   11 minutes ago   /bin/sh -c ./configure                          7.39kB    
ca1acf4b4536   11 minutes ago   /bin/sh -c gcc --version                        0B        
5cc4fadbc4c0   11 minutes ago   /bin/sh -c apt-get update && apt-get install…   184MB     
5231faa3aa1f   11 minutes ago   /bin/sh -c ls                                   0B        
406b763579ad   11 minutes ago   /bin/sh -c #(nop) WORKDIR /home/join/JoCaml_…   0B        
955fd7f4b5bd   11 minutes ago   /bin/sh -c tar -xf jocaml-4.01.0.tar.gz         11.9MB    
ea2d70a097d3   11 minutes ago   /bin/sh -c wget http://jocaml.inria.fr/pub/d…   2.59MB    
af18218ad928   12 minutes ago   /bin/sh -c apt-get update && apt-get install…   7.5MB     
40ae8cffbfd3   12 minutes ago   /bin/sh -c apt-get update && apt-get install…   1.37MB    
4d75fe90cd54   12 minutes ago   /bin/sh -c apt-get update && apt-get install…   37.6MB    
b9be2c80c106   12 minutes ago   /bin/sh -c #(nop) WORKDIR /home/join/JoCaml_…   0B        
33a7dbb40264   12 minutes ago   /bin/sh -c useradd -ms /bin/bash  join          335kB     
8fac24139163   12 minutes ago   /bin/sh -c ln -sf /bin/bash /bin/sh             9B        
9499db781771   3 weeks ago      /bin/sh -c #(nop)  CMD ["/bin/bash"]            0B        
<missing>      3 weeks ago      /bin/sh -c mkdir -p /run/systemd && echo 'do…   7B        
<missing>      3 weeks ago      /bin/sh -c rm -rf /var/lib/apt/lists/*          0B        
<missing>      3 weeks ago      /bin/sh -c set -xe   && echo '#!/bin/sh' > /…   745B      
<missing>      3 weeks ago      /bin/sh -c #(nop) ADD file:8eef54430e581236e…   131MB     
~>/Dockerized-join-calculus$ 
```

Intermediate version v1 : 
```
~>/Dockerized-join-calculus$ sudo docker history jocaml:latest
IMAGE          CREATED             CREATED BY                                      SIZE      COMMENT
979eb47ba781   28 seconds ago      /bin/sh -c #(nop)  CMD ["/bin/bash"]            0B        
0d4fb737645f   28 seconds ago      /bin/sh -c #(nop)  USER join                    0B        
0a0dc254ca52   29 seconds ago      /bin/sh -c chown --recursive join:group /hom…   19.3MB    
5f395ff3a2cd   43 seconds ago      /bin/sh -c adduser --disabled-password --sys…   40.4kB    
7f48dae0b1b1   44 seconds ago      /bin/sh -c addgroup --system group              2.15kB    
a5d0be3deb97   45 seconds ago      /bin/sh -c #(nop) WORKDIR /home/join            0B        
8c74b9dffced   47 seconds ago      /bin/sh -c apt-get update && apt-get install…   232MB     
3910837e55ab   5 minutes ago       /bin/sh -c #(nop) WORKDIR /home/join/JoCaml_…   0B        
5b3c0cb32d03   5 minutes ago       /bin/sh -c apt-get update &&     apt-get ins…   51MB      
6009384b29c8   26 minutes ago      /bin/sh -c #(nop) WORKDIR /home/join/JoCaml_…   0B        
8fac24139163   About an hour ago   /bin/sh -c ln -sf /bin/bash /bin/sh             9B        
9499db781771   3 weeks ago         /bin/sh -c #(nop)  CMD ["/bin/bash"]            0B        
<missing>      3 weeks ago         /bin/sh -c mkdir -p /run/systemd && echo 'do…   7B        
<missing>      3 weeks ago         /bin/sh -c rm -rf /var/lib/apt/lists/*          0B        
<missing>      3 weeks ago         /bin/sh -c set -xe   && echo '#!/bin/sh' > /…   745B      
<missing>      3 weeks ago         /bin/sh -c #(nop) ADD file:8eef54430e581236e…   131MB     
~>/Dockerized-join-calculus$ 
```
Version v2.2 : 
```
>/Dockerized-join-calculus$ sudo docker history jocaml:latest
IMAGE          CREATED         CREATED BY                                      SIZE      COMMENT
ac09976f6ab7   2 minutes ago   /bin/sh -c #(nop)  CMD ["/bin/bash"]            0B        
184011093dac   2 minutes ago   /bin/sh -c #(nop)  USER join                    0B        
6d59f9cb8c19   2 minutes ago   /bin/sh -c chown --recursive join:group /hom…   0B        
cbfae1cd0687   2 minutes ago   /bin/sh -c adduser --disabled-password --sys…   40.4kB    
a69a3df181e1   2 minutes ago   /bin/sh -c addgroup --system group              2.1kB     
8429ba73f0ca   2 minutes ago   /bin/sh -c #(nop) WORKDIR /home/join            0B        
64ee99783dcb   2 minutes ago   /bin/sh -c #(nop) COPY dir:96fa3f2aa449fead0…   269MB     
9499db781771   3 weeks ago     /bin/sh -c #(nop)  CMD ["/bin/bash"]            0B        
<missing>      3 weeks ago     /bin/sh -c mkdir -p /run/systemd && echo 'do…   7B        
<missing>      3 weeks ago     /bin/sh -c rm -rf /var/lib/apt/lists/*          0B        
<missing>      3 weeks ago     /bin/sh -c set -xe   && echo '#!/bin/sh' > /…   745B      
<missing>      3 weeks ago     /bin/sh -c #(nop) ADD file:8eef54430e581236e…   131MB
```
