### DevOps with Docker https://devopswithdocker.com/ part3 exercises 

------------------------------------------------------------
3.1
Return back to our frontend & backend Dockerfiles and you should see the some mistakes we now know to fix.

Document both image sizes at this point, as was done in the material. Optimize the Dockerfiles of both programs, frontend and backend, by joining the RUN commands and removing useless parts.

After your improvements document the image sizes again. The size difference may not be very much yet. The frontend should be around 432MB when using FROM ubuntu:16.04. The backend should be around 351MB. The sizes may vary.
-------------------------------------------------------------------
```
>/front$ sudo docker history
"docker history" requires exactly 1 argument.
See 'docker history --help'.

Usage:  docker history [OPTIONS] IMAGE

Show the history of an image
~>/front$ sudo docker image ls -a
REPOSITORY          TAG                 IMAGE ID            CREATED              SIZE
<none>              <none>              118651088723        40 seconds ago       283MB
<none>              <none>              be10f442b28b        40 seconds ago       283MB
<none>              <none>              4157e1a03b19        44 seconds ago       283MB
<none>              <none>              c4ac8fb1f443        About a minute ago   5.57MB
ubuntu              16.04               dfeff22e96ae        3 weeks ago          131MB
alpine              latest              d6e46aa2470d        3 weeks ago          5.57MB
~>/front$ sudo history alpine
sudo: history: command not found
~>/front$ sudo docker history alpine
IMAGE               CREATED             CREATED BY                                      SIZE                COMMENT
d6e46aa2470d        3 weeks ago         /bin/sh -c #(nop)  CMD ["/bin/sh"]              0B                  
<missing>           3 weeks ago         /bin/sh -c #(nop) ADD file:f17f65714f703db90…   5.57MB              
~>/front$ ^C
~>/front$ 
```