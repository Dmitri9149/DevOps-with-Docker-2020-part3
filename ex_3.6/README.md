The size of the image is about 135.64 MB.
```
>/ex_3.6$ sudo docker history front:latest
IMAGE          CREATED          CREATED BY                                      SIZE      COMMENT
7a8810645db1   20 minutes ago   /bin/sh -c #(nop)  EXPOSE 80                    0B        
af30efacbadd   20 minutes ago   /bin/sh -c #(nop) COPY dir:5b275bc5a5e5a0189…   2.74MB    
ae2feff98a0c   4 days ago       /bin/sh -c #(nop)  CMD ["nginx" "-g" "daemon…   0B        
<missing>      4 days ago       /bin/sh -c #(nop)  STOPSIGNAL SIGQUIT           0B        
<missing>      4 days ago       /bin/sh -c #(nop)  EXPOSE 80                    0B        
<missing>      4 days ago       /bin/sh -c #(nop)  ENTRYPOINT ["/docker-entr…   0B        
<missing>      4 days ago       /bin/sh -c #(nop) COPY file:0fd5fca330dcd6a7…   1.04kB    
<missing>      4 days ago       /bin/sh -c #(nop) COPY file:0b866ff3fc1ef5b0…   1.96kB    
<missing>      4 days ago       /bin/sh -c #(nop) COPY file:e7e183879c35719c…   1.2kB     
<missing>      4 days ago       /bin/sh -c set -x     && addgroup --system -…   63.7MB    
<missing>      4 days ago       /bin/sh -c #(nop)  ENV PKG_RELEASE=1~buster     0B        
<missing>      4 days ago       /bin/sh -c #(nop)  ENV NJS_VERSION=0.5.0        0B        
<missing>      4 days ago       /bin/sh -c #(nop)  ENV NGINX_VERSION=1.19.6     0B        
<missing>      9 days ago       /bin/sh -c #(nop)  LABEL maintainer=NGINX Do…   0B        
<missing>      9 days ago       /bin/sh -c #(nop)  CMD ["bash"]                 0B        
<missing>      9 days ago       /bin/sh -c #(nop) ADD file:3a7bff4e139bcacc5…   69.2MB    
~>/ex_3.6$ 
```