### DevOps with Docker https://devopswithdocker.com/ part3 exercises 

------------------------------------------------------------
3.1
Return back to our frontend & backend Dockerfiles and you should see the some mistakes we now know to fix.

Document both image sizes at this point, as was done in the material. Optimize the Dockerfiles of both programs, frontend and backend, by joining the RUN commands and removing useless parts.

After your improvements document the image sizes again. The size difference may not be very much yet. The frontend should be around 432MB when using FROM ubuntu:16.04. The backend should be around 351MB. The sizes may vary.
-------------------------------------------------------------------
```
/back$ sudo docker image ls -a
REPOSITORY          TAG                 IMAGE ID            CREATED             SIZE
back                latest              50231a6904bd        14 seconds ago      73.2MB
<none>              <none>              87051060043f        15 seconds ago      73.2MB
<none>              <none>              a846ac3658d5        16 seconds ago      73.2MB
<none>              <none>              b4303daf7b89        36 seconds ago      5.57MB
alpine              latest              d6e46aa2470d        3 weeks ago         5.57MB
~>/back$ sudo docker history back
IMAGE               CREATED             CREATED BY                                      SIZE                COMMENT
50231a6904bd        28 seconds ago      /bin/sh -c #(nop)  CMD ["/bin/sh" "-c" "npm …   0B                  
87051060043f        29 seconds ago      /bin/sh -c #(nop)  EXPOSE 8000                  0B                  
a846ac3658d5        30 seconds ago      /bin/sh -c apk add --no-cache git nodejs nod…   67.6MB              
b4303daf7b89        50 seconds ago      /bin/sh -c #(nop) WORKDIR /usr/app              0B                  
d6e46aa2470d        3 weeks ago         /bin/sh -c #(nop)  CMD ["/bin/sh"]              0B                  
<missing>           3 weeks ago         /bin/sh -c #(nop) ADD file:f17f65714f703db90…   5.57MB              
~>/back$ 
```
```
>/front$ sudo docker image ls -a
REPOSITORY          TAG                 IMAGE ID            CREATED              SIZE
<none>              <none>              73929f3d9869        12 seconds ago       268MB
front               latest              a29ad9d3a419        12 seconds ago       268MB
<none>              <none>              821d5272dc86        16 seconds ago       268MB
<none>              <none>              7c468e7e72c8        About a minute ago   5.57MB
alpine              latest              d6e46aa2470d        3 weeks ago          5.57MB
~>/front$ sudo docker history front
IMAGE               CREATED              CREATED BY                                      SIZE                COMMENT
a29ad9d3a419        29 seconds ago       /bin/sh -c #(nop)  CMD ["/bin/sh" "-c" "npm …   0B                  
73929f3d9869        29 seconds ago       /bin/sh -c #(nop)  EXPOSE 5000                  0B                  
821d5272dc86        33 seconds ago       /bin/sh -c apk add --no-cache git nodejs nod…   262MB               
7c468e7e72c8        About a minute ago   /bin/sh -c #(nop) WORKDIR /usr/app              0B                  
d6e46aa2470d        3 weeks ago          /bin/sh -c #(nop)  CMD ["/bin/sh"]              0B                  
<missing>           3 weeks ago          /bin/sh -c #(nop) ADD file:f17f65714f703db90…   5.57MB              
~>/front$ 
```
----------------------------------------
3.2 A deployment pipeline to heroku
Let’s create our first deployment pipeline!

For this exercise you can select which ever web application you already have containerized.

If you don’t have any web applications available you can use any one from this course and modify it. (Such as the course material itself)

Let’s use GitHub, CircleCI, and Heroku to deploy to heroku. You can also use GitHub actions instead of CircleCI.

CircleCI offers orbs for Heroku deployment, but you can just use the instructions from Heroku (or exercise 1.16).

Submit a link to the repository with the config.

----------------------------------------------------------------

The deployment pipeline to Heroku was done with GiHub actions    
(see .github/workflows/ex_3_2.yaml)

The app is here : https://docker-devops-2020.herokuapp.com/