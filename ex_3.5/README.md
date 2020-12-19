### Some size experiments with sizes of images

For the 1.10 ex. frontend, Dockerfile (from which we start): image size is about 682.2 MB 
(base image ubuntu) + copy project from local folder

```
~>/frontend-example-docker$ sudo docker history front-1-10
IMAGE          CREATED              CREATED BY                                      SIZE      COMMENT
cb5092ee87fa   About a minute ago   /bin/sh -c #(nop)  CMD ["/bin/sh" "-c" "npm …   0B        
926f54c622b9   About a minute ago   /bin/sh -c #(nop)  ENV API_URL=http://127.0.…   0B        
7de01310261d   About a minute ago   /bin/sh -c #(nop)  EXPOSE 5000                  0B        
36ef14b86275   About a minute ago   /bin/sh -c #(nop) COPY dir:905a9d88c332fd7f8…   196MB     
a521c68fd400   2 minutes ago        /bin/sh -c npm install                          172MB     
67d6dd617fb0   3 minutes ago        /bin/sh -c #(nop) COPY file:aaeb58e8845b0843…   1.7kB     
70061ba5b3e6   3 minutes ago        /bin/sh -c apt install -y nodejs                103MB     
a6f2113a0b03   3 minutes ago        /bin/sh -c curl -sL https://deb.nodesource.c…   33.6MB    
045605572c99   3 minutes ago        /bin/sh -c apt-get update && apt-get install…   46.6MB    
b25d03f486b0   4 minutes ago        /bin/sh -c #(nop) WORKDIR /dist                 0B        
9499db781771   3 weeks ago          /bin/sh -c #(nop)  CMD ["/bin/bash"]            0B        
<missing>      3 weeks ago          /bin/sh -c mkdir -p /run/systemd && echo 'do…   7B        
<missing>      3 weeks ago          /bin/sh -c rm -rf /var/lib/apt/lists/*          0B        
<missing>      3 weeks ago          /bin/sh -c set -xe   && echo '#!/bin/sh' > /…   745B      
<missing>      3 weeks ago          /bin/sh -c #(nop) ADD file:8eef54430e581236e…   131MB     
~>/frontend-example-docker$ 
```



For the OPTIMISED frontend Dockerfile: the size is about 238.97 MB
```
??????>/front$ sudo docker history front:latest
IMAGE          CREATED              CREATED BY                                      SIZE      COMMENT
dfa0df32e471   About a minute ago   /bin/sh -c #(nop)  CMD ["serve" "-s" "-l" "5…   0B        
15193109cab3   About a minute ago   /bin/sh -c #(nop)  EXPOSE 5000                  0B        
1bc9e0f01bb5   About a minute ago   /bin/sh -c #(nop)  USER new_user                0B        
a0a3106dbfcd   About a minute ago   /bin/sh -c npm install -g serve &&     addgr…   10.9MB    
f95b69f29b28   About a minute ago   /bin/sh -c #(nop) COPY dir:5b275bc5a5e5a0189…   2.74MB    
9e037ac02b0f   3 minutes ago        /bin/sh -c #(nop) WORKDIR /usr/app              0B        
46437a676663   30 hours ago         /bin/sh -c #(nop)  CMD ["node"]                 0B        
<missing>      30 hours ago         /bin/sh -c #(nop)  ENTRYPOINT ["docker-entry…   0B        
<missing>      30 hours ago         /bin/sh -c #(nop) COPY file:238737301d473041…   116B      
<missing>      30 hours ago         /bin/sh -c apk add --no-cache --virtual .bui…   7.62MB    
<missing>      30 hours ago         /bin/sh -c #(nop)  ENV YARN_VERSION=1.22.5      0B        
<missing>      30 hours ago         /bin/sh -c addgroup -g 1000 node     && addu…   96.1MB    
<missing>      30 hours ago         /bin/sh -c #(nop)  ENV NODE_VERSION=15.4.0      0B        
<missing>      42 hours ago         /bin/sh -c #(nop)  CMD ["/bin/sh"]              0B        
<missing>      42 hours ago         /bin/sh -c #(nop) ADD file:8ed80010e443da19d…   5.61MB    
~>/front$ 
```

For the OPTIMISED backend  Dockerfile the size is about : 245.23 MB (but about 96.1 MB are 
coming from addgroup ... adduser command , without it the size will be about 149.12 MB)
```
>/back$ sudo docker history back:latest
[sudo] password for dmitri: 
IMAGE          CREATED          CREATED BY                                      SIZE      COMMENT
b1d58e9cedf4   31 minutes ago   /bin/sh -c #(nop)  CMD ["npm" "start"]          0B        
c02b04e6dfb6   31 minutes ago   /bin/sh -c #(nop)  EXPOSE 8000                  0B        
f964b6bb2d2c   31 minutes ago   /bin/sh -c #(nop)  USER new_user                0B        
d205cc05851a   31 minutes ago   /bin/sh -c apk add --no-cache git &&     git…   19.9MB    
9e037ac02b0f   38 minutes ago   /bin/sh -c #(nop) WORKDIR /usr/app              0B        
46437a676663   31 hours ago     /bin/sh -c #(nop)  CMD ["node"]                 0B        
<missing>      31 hours ago     /bin/sh -c #(nop)  ENTRYPOINT ["docker-entry…   0B        
<missing>      31 hours ago     /bin/sh -c #(nop) COPY file:238737301d473041…   116B      
<missing>      31 hours ago     /bin/sh -c apk add --no-cache --virtual .bui…   7.62MB    
<missing>      31 hours ago     /bin/sh -c #(nop)  ENV YARN_VERSION=1.22.5      0B        
<missing>      31 hours ago     /bin/sh -c addgroup -g 1000 node     && addu…   96.1MB    
<missing>      31 hours ago     /bin/sh -c #(nop)  ENV NODE_VERSION=15.4.0      0B        
<missing>      43 hours ago     /bin/sh -c #(nop)  CMD ["/bin/sh"]              0B        
<missing>      43 hours ago     /bin/sh -c #(nop) ADD file:8ed80010e443da19d…   5.61MB    
~>/back$ 
```

As unoptimized frontend let us take the frontend in Dockerfile ex. 3.4 : the base image there is alpine (not node:alpine as in optimized frontend Dockerfile). 
The size of unoptimized image is 283.58 MB. 
```
~>/front$ sudo docker history front-n:latest
IMAGE          CREATED          CREATED BY                                      SIZE      COMMENT
598e92a13da5   51 seconds ago   /bin/sh -c #(nop)  CMD ["npm" "start"]          0B        
4f50f55d33eb   51 seconds ago   /bin/sh -c #(nop)  EXPOSE 5000                  0B        
9cd9f7b46c1f   51 seconds ago   /bin/sh -c #(nop)  USER new_user                0B        
abe7f23ea4c8   57 seconds ago   /bin/sh -c apk add --no-cache git nodejs nod…   278MB     
809d01f2a5b4   2 minutes ago    /bin/sh -c #(nop) WORKDIR /usr/app              0B        
389fef711851   43 hours ago     /bin/sh -c #(nop)  CMD ["/bin/sh"]              0B        
<missing>      43 hours ago     /bin/sh -c #(nop) ADD file:ec475c2abb2d46435…   5.58MB    
~>/front$ 
```

Backend not optim 
```
~>/back$ sudo docker history back-n:latest
IMAGE          CREATED              CREATED BY                                      SIZE      COMMENT
f1f5680b576c   About a minute ago   /bin/sh -c #(nop)  CMD ["npm" "start"]          0B        
c393c9c30010   About a minute ago   /bin/sh -c #(nop)  EXPOSE 8000                  0B        
65cc13551602   About a minute ago   /bin/sh -c #(nop)  USER new_user                0B        
88338863ae9c   About a minute ago   /bin/sh -c apk add --no-cache git nodejs nod…   83.5MB    
828264d15a3a   About a minute ago   /bin/sh -c #(nop) WORKDIR /usr/app              0B        
389fef711851   44 hours ago         /bin/sh -c #(nop)  CMD ["/bin/sh"]              0B        
<missing>      44 hours ago         /bin/sh -c #(nop) ADD file:ec475c2abb2d46435…   5.58MB    
~>/back$ 
```