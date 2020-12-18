### For the OPTIMISED frontend Dockerfile: the size is about 238.97 MB
```
~>/front$ sudo docker history front:latest
IMAGE          CREATED         CREATED BY                                      SIZE      COMMENT
a1191a0b9d67   3 minutes ago   /bin/sh -c #(nop)  CMD ["serve" "-s" "-l" "5…   0B        
11f6842d0d5f   3 minutes ago   /bin/sh -c #(nop)  EXPOSE 5000                  0B        
bc3fccf39486   3 minutes ago   /bin/sh -c #(nop)  USER new_user                0B        
46ef1c3c6378   3 minutes ago   /bin/sh -c npm install -g serve &&     addgr…   10.9MB    
279ba94b0d89   4 minutes ago   /bin/sh -c #(nop) COPY dir:5b275bc5a5e5a0189…   2.74MB    
7fe003949570   5 minutes ago   /bin/sh -c #(nop) WORKDIR /usr/app              0B        
46437a676663   26 hours ago    /bin/sh -c #(nop)  CMD ["node"]                 0B        
<missing>      26 hours ago    /bin/sh -c #(nop)  ENTRYPOINT ["docker-entry…   0B        
<missing>      26 hours ago    /bin/sh -c #(nop) COPY file:238737301d473041…   116B      
<missing>      26 hours ago    /bin/sh -c apk add --no-cache --virtual .bui…   7.62MB    
<missing>      26 hours ago    /bin/sh -c #(nop)  ENV YARN_VERSION=1.22.5      0B        
<missing>      26 hours ago    /bin/sh -c addgroup -g 1000 node     && addu…   96.1MB    
<missing>      26 hours ago    /bin/sh -c #(nop)  ENV NODE_VERSION=15.4.0      0B        
<missing>      39 hours ago    /bin/sh -c #(nop)  CMD ["/bin/sh"]              0B        
<missing>      39 hours ago    /bin/sh -c #(nop) ADD file:8ed80010e443da19d…   5.61MB    
~>/front$ ^C
~>/front$ ^C
~>/front$ ```

For the OPTIMISED backend  Dockerfile the size is about : 245.23 MB (but about 96.1 MB are 
coming from addgroup ... adduser command , without it the size will be about 149.12 MB)
```
~>/back$ sudo docker history back:latest
IMAGE          CREATED              CREATED BY                                      SIZE      COMMENT
ce52cd229bbc   About a minute ago   /bin/sh -c #(nop)  CMD ["npm" "start"]          0B        
9c97cde34a62   About a minute ago   /bin/sh -c #(nop)  EXPOSE 8000                  0B        
2a72e9f51400   About a minute ago   /bin/sh -c #(nop)  USER new_user                0B        
5ab7676c8e79   About a minute ago   /bin/sh -c apk add --no-cache git &&     git…   19.9MB    
cfefe9d89374   About a minute ago   /bin/sh -c #(nop) WORKDIR /usr/app              0B        
46437a676663   27 hours ago         /bin/sh -c #(nop)  CMD ["node"]                 0B        
<missing>      27 hours ago         /bin/sh -c #(nop)  ENTRYPOINT ["docker-entry…   0B        
<missing>      27 hours ago         /bin/sh -c #(nop) COPY file:238737301d473041…   116B      
<missing>      27 hours ago         /bin/sh -c apk add --no-cache --virtual .bui…   7.62MB    
<missing>      27 hours ago         /bin/sh -c #(nop)  ENV YARN_VERSION=1.22.5      0B        
<missing>      27 hours ago         /bin/sh -c addgroup -g 1000 node     && addu…   96.1MB    
<missing>      27 hours ago         /bin/sh -c #(nop)  ENV NODE_VERSION=15.4.0      0B        
<missing>      40 hours ago         /bin/sh -c #(nop)  CMD ["/bin/sh"]              0B        
<missing>      40 hours ago         /bin/sh -c #(nop) ADD file:8ed80010e443da19d…   5.61MB    ```