The Dockerfile is for the JoCaml language containerization. JoCaml is programming 
language on the basis of join-calculus: parallel distributed process calculus (qute fundumental calculus, an alternative to lambda calcuus). 
See my project on GitHub: https://github.com/Dmitri9149/Dockerized-join-calculus 

The ouput of history command for the original Dockerfile (see Dockerfile_init):
(the size of image is about 532.36 MB)
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

Final version (see Dockerfile):
(the size of image is about 486.9 MB but vim is added to the final version, 
which add about 87.9 MB , so the comparable value is 399.0 MB in final version) 
```
~>/Dockerized-join-calculus$ sudo docker history jocaml:latest
IMAGE          CREATED          CREATED BY                                      SIZE      COMMENT
02eac3269666   43 minutes ago   /bin/sh -c #(nop)  CMD ["/bin/bash"]            0B        
cb473cb38c73   43 minutes ago   /bin/sh -c #(nop)  USER join                    0B        
db95d6feab38   43 minutes ago   /bin/sh -c apt-get update && apt-get install…   87.9MB    
49e83a2c382e   43 minutes ago   /bin/sh -c #(nop) WORKDIR /home/join            0B        
e8e653b8046c   43 minutes ago   /bin/sh -c #(nop) COPY dir:c66223f713d6c7329…   268MB     
9499db781771   3 weeks ago      /bin/sh -c #(nop)  CMD ["/bin/bash"]            0B        
<missing>      3 weeks ago      /bin/sh -c mkdir -p /run/systemd && echo 'do…   7B        
<missing>      3 weeks ago      /bin/sh -c rm -rf /var/lib/apt/lists/*          0B        
<missing>      3 weeks ago      /bin/sh -c set -xe   && echo '#!/bin/sh' > /…   745B      
<missing>      3 weeks ago      /bin/sh -c #(nop) ADD file:8eef54430e581236e…   131MB     
~>/Dockerized-join-calculus$ 
```

