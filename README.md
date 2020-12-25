### DevOps with Docker https://devopswithdocker.com/ part3 exercises 

I used some tips from : 
https://github.com/aanykanen/docker-mooc-2020  
and
https://github.com/McFizh/devops-docker-2020   

->-----------------------------------------------------------   
3.1
Return back to our frontend & backend Dockerfiles and you should see the some mistakes we now know to fix.

Document both image sizes at this point, as was done in the material. Optimize the Dockerfiles of both programs, frontend and backend, by joining the RUN commands and removing useless parts.

After your improvements document the image sizes again. The size difference may not be very much yet. The frontend should be around 432MB when using FROM ubuntu:16.04. The backend should be around 351MB. The sizes may vary.   
->------------------------------------------------------------------       
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
->---------------------------------------             
3.2 A deployment pipeline to heroku
Let’s create our first deployment pipeline!

For this exercise you can select which ever web application you already have containerized.

If you don’t have any web applications available you can use any one from this course and modify it. (Such as the course material itself)

Let’s use GitHub, CircleCI, and Heroku to deploy to heroku. You can also use GitHub actions instead of CircleCI.

CircleCI offers orbs for Heroku deployment, but you can just use the instructions from Heroku (or exercise 1.16).

Submit a link to the repository with the config.   

->---------------------------------------------------------------           

The deployment pipeline to Heroku was done with GiHub actions    
(see .github/workflows/ex_3_2.yaml)

The app is here : https://docker-devops-2020.herokuapp.com/   

->---------------------------------------------------------------     
3.3 Building images inside of a container
Watchtower uses volume to docker.sock socket to access Docker daemon of the host from the container. By leveraging this ourselves we can create our own simple build service.

Create a project that downloads a repository from github, builds a Dockerfile located in the root and then publishes it into Docker Hub.

You can use any programming language / technology for the project implementation. A simple bash script is viable

Then create a Dockerfile for it so that it can be run inside a container.

Make sure that it can build at least some of the example projects.   
->--------------------------------------------------------------------    

```
~>/ex_3.3$ sudo docker-compose up
^[[6~Building get_and_build
Step 1/5 : FROM alpine:3.12
3.12: Pulling from library/alpine
05e7bc50f07f: Pull complete
Digest: sha256:a126728cb7db157f0deb377bcba3c5e473e612d7bafc27f6bb4e5e083f9f08c2
Status: Downloaded newer image for alpine:3.12
 ---> b14afc6dfb98
Step 2/5 : WORKDIR /usr/app
 ---> Running in ad6131dad588
Removing intermediate container ad6131dad588
 ---> f3fb4fa40829
Step 3/5 : COPY builder.sh ./
 ---> 76d1252b17df
Step 4/5 : RUN apk add --no-cache git docker &&     chmod +x builder.sh
 ---> Running in c3b88fe0244e
fetch http://dl-cdn.alpinelinux.org/alpine/v3.12/main/x86_64/APKINDEX.tar.gz
fetch http://dl-cdn.alpinelinux.org/alpine/v3.12/community/x86_64/APKINDEX.tar.gz
(1/17) Installing ca-certificates (20191127-r4)
(2/17) Installing libseccomp (2.4.3-r0)
(3/17) Installing runc (1.0.0_rc10-r1)
(4/17) Installing containerd (1.3.9-r0)
(5/17) Installing libmnl (1.0.4-r0)
(6/17) Installing libnftnl-libs (1.1.6-r0)
(7/17) Installing iptables (1.8.4-r2)
(8/17) Installing tini-static (0.19.0-r0)
(9/17) Installing device-mapper-libs (2.02.186-r1)
(10/17) Installing docker-engine (19.03.12-r0)
(11/17) Installing docker-cli (19.03.12-r0)
(12/17) Installing docker (19.03.12-r0)
Executing docker-19.03.12-r0.pre-install
(13/17) Installing nghttp2-libs (1.41.0-r0)
(14/17) Installing libcurl (7.69.1-r3)
(15/17) Installing expat (2.2.9-r1)
(16/17) Installing pcre2 (10.35-r0)
(17/17) Installing git (2.26.2-r0)
Executing busybox-1.31.1-r19.trigger
Executing ca-certificates-20191127-r4.trigger
OK: 322 MiB in 31 packages
Removing intermediate container c3b88fe0244e
 ---> a266619b24bd
Step 5/5 : ENTRYPOINT [ "./builder.sh" ]
 ---> Running in ba6ffa015a59
Removing intermediate container ba6ffa015a59
 ---> b2729562ad0b

Successfully built b2729562ad0b
Successfully tagged get_build:latest
WARNING: Image for service get_and_build was built because it did not already exist. To rebuild this image you must use `docker-compose build` or `docker-compose up --build`.
Creating ex_33_get_and_build_1 ... done
Attaching to ex_33_get_and_build_1
get_and_build_1  | Cloning into 'repo'...
get_and_build_1  | Sending build context to Docker daemon  8.192kB
get_and_build_1  | Step 1/9 : FROM ubuntu
get_and_build_1  | latest: Pulling from library/ubuntu
get_and_build_1  | da7391352a9b: Pulling fs layer
get_and_build_1  | 14428a6d4bcd: Pulling fs layer
get_and_build_1  | 2c2d948710f2: Pulling fs layer
get_and_build_1  | 14428a6d4bcd: Verifying Checksum
get_and_build_1  | 14428a6d4bcd: Download complete
get_and_build_1  | 2c2d948710f2: Download complete
get_and_build_1  | da7391352a9b: Verifying Checksum
get_and_build_1  | da7391352a9b: Download complete
get_and_build_1  | da7391352a9b: Pull complete
get_and_build_1  | 14428a6d4bcd: Pull complete
get_and_build_1  | 2c2d948710f2: Pull complete
get_and_build_1  | Digest: sha256:c95a8e48bf88e9849f3e0f723d9f49fa12c5a00cfc6e60d2bc99d87555295e4c
get_and_build_1  | Status: Downloaded newer image for ubuntu:latest
get_and_build_1  |  ---> f643c72bc252
get_and_build_1  | Step 2/9 : RUN apt-get update
get_and_build_1  |  ---> Running in 19c98c8235a7
get_and_build_1  | Get:1 http://security.ubuntu.com/ubuntu focal-security InRelease [109 kB]
get_and_build_1  | Get:2 http://archive.ubuntu.com/ubuntu focal InRelease [265 kB]
get_and_build_1  | Get:3 http://archive.ubuntu.com/ubuntu focal-updates InRelease [114 kB]
get_and_build_1  | Get:4 http://archive.ubuntu.com/ubuntu focal-backports InRelease [101 kB]
get_and_build_1  | Get:5 http://security.ubuntu.com/ubuntu focal-security/restricted amd64 Packages [103 kB]
get_and_build_1  | Get:6 http://security.ubuntu.com/ubuntu focal-security/universe amd64 Packages [645 kB]
get_and_build_1  | Get:7 http://archive.ubuntu.com/ubuntu focal/universe amd64 Packages [11.3 MB]
get_and_build_1  | Get:8 http://security.ubuntu.com/ubuntu focal-security/main amd64 Packages [495 kB]
get_and_build_1  | Get:9 http://security.ubuntu.com/ubuntu focal-security/multiverse amd64 Packages [1167 B]
get_and_build_1  | Get:10 http://archive.ubuntu.com/ubuntu focal/restricted amd64 Packages [33.4 kB]
get_and_build_1  | Get:11 http://archive.ubuntu.com/ubuntu focal/main amd64 Packages [1275 kB]
get_and_build_1  | Get:12 http://archive.ubuntu.com/ubuntu focal/multiverse amd64 Packages [177 kB]
get_and_build_1  | Get:13 http://archive.ubuntu.com/ubuntu focal-updates/universe amd64 Packages [881 kB]
get_and_build_1  | Get:14 http://archive.ubuntu.com/ubuntu focal-updates/main amd64 Packages [885 kB]
get_and_build_1  | Get:15 http://archive.ubuntu.com/ubuntu focal-updates/restricted amd64 Packages [136 kB]
get_and_build_1  | Get:16 http://archive.ubuntu.com/ubuntu focal-updates/multiverse amd64 Packages [30.4 kB]
get_and_build_1  | Get:17 http://archive.ubuntu.com/ubuntu focal-backports/universe amd64 Packages [4250 B]
get_and_build_1  | Fetched 16.6 MB in 4s (4263 kB/s)
get_and_build_1  | Reading package lists...
get_and_build_1  | Removing intermediate container 19c98c8235a7
get_and_build_1  |  ---> 3028da37655b
get_and_build_1  | Step 3/9 : RUN apt-get install nginx -y
get_and_build_1  |  ---> Running in 068f9e5b612b
get_and_build_1  | Reading package lists...
get_and_build_1  | Building dependency tree...
get_and_build_1  | Reading state information...
get_and_build_1  | The following additional packages will be installed:
get_and_build_1  |   fontconfig-config fonts-dejavu-core iproute2 libatm1 libbsd0 libcap2
get_and_build_1  |   libcap2-bin libelf1 libexpat1 libfontconfig1 libfreetype6 libgd3 libicu66
get_and_build_1  |   libjbig0 libjpeg-turbo8 libjpeg8 libmnl0 libnginx-mod-http-image-filter
get_and_build_1  |   libnginx-mod-http-xslt-filter libnginx-mod-mail libnginx-mod-stream
get_and_build_1  |   libpam-cap libpng16-16 libssl1.1 libtiff5 libwebp6 libx11-6 libx11-data
get_and_build_1  |   libxau6 libxcb1 libxdmcp6 libxml2 libxpm4 libxslt1.1 libxtables12
get_and_build_1  |   nginx-common nginx-core tzdata ucf
get_and_build_1  | Suggested packages:
get_and_build_1  |   iproute2-doc libgd-tools fcgiwrap nginx-doc ssl-cert
get_and_build_1  | The following NEW packages will be installed:
get_and_build_1  |   fontconfig-config fonts-dejavu-core iproute2 libatm1 libbsd0 libcap2
get_and_build_1  |   libcap2-bin libelf1 libexpat1 libfontconfig1 libfreetype6 libgd3 libicu66
get_and_build_1  |   libjbig0 libjpeg-turbo8 libjpeg8 libmnl0 libnginx-mod-http-image-filter
get_and_build_1  |   libnginx-mod-http-xslt-filter libnginx-mod-mail libnginx-mod-stream
get_and_build_1  |   libpam-cap libpng16-16 libssl1.1 libtiff5 libwebp6 libx11-6 libx11-data
get_and_build_1  |   libxau6 libxcb1 libxdmcp6 libxml2 libxpm4 libxslt1.1 libxtables12 nginx
get_and_build_1  |   nginx-common nginx-core tzdata ucf
get_and_build_1  | 0 upgraded, 40 newly installed, 0 to remove and 2 not upgraded.
get_and_build_1  | Need to get 15.8 MB of archives.
get_and_build_1  | After this operation, 60.8 MB of additional disk space will be used.
get_and_build_1  | Get:1 http://archive.ubuntu.com/ubuntu focal/main amd64 libbsd0 amd64 0.10.0-1 [45.4 kB]
get_and_build_1  | Get:2 http://archive.ubuntu.com/ubuntu focal/main amd64 libcap2 amd64 1:2.32-1 [15.9 kB]
get_and_build_1  | Get:3 http://archive.ubuntu.com/ubuntu focal/main amd64 libelf1 amd64 0.176-1.1build1 [44.0 kB]
get_and_build_1  | Get:4 http://archive.ubuntu.com/ubuntu focal/main amd64 libmnl0 amd64 1.0.4-2 [12.3 kB]
get_and_build_1  | Get:5 http://archive.ubuntu.com/ubuntu focal/main amd64 libxtables12 amd64 1.8.4-3ubuntu2 [28.4 kB]
get_and_build_1  | Get:6 http://archive.ubuntu.com/ubuntu focal/main amd64 libcap2-bin amd64 1:2.32-1 [26.2 kB]
get_and_build_1  | Get:7 http://archive.ubuntu.com/ubuntu focal/main amd64 iproute2 amd64 5.5.0-1ubuntu1 [858 kB]
get_and_build_1  | Get:8 http://archive.ubuntu.com/ubuntu focal/main amd64 libatm1 amd64 1:2.5.1-4 [21.8 kB]
get_and_build_1  | Get:9 http://archive.ubuntu.com/ubuntu focal/main amd64 libexpat1 amd64 2.2.9-1build1 [73.3 kB]
get_and_build_1  | Get:10 http://archive.ubuntu.com/ubuntu focal-updates/main amd64 tzdata all 2020d-0ubuntu0.20.04 [294 kB]
get_and_build_1  | Get:11 http://archive.ubuntu.com/ubuntu focal/main amd64 libicu66 amd64 66.1-2ubuntu2 [8520 kB]
get_and_build_1  | Get:12 http://archive.ubuntu.com/ubuntu focal/main amd64 libpam-cap amd64 1:2.32-1 [8352 B]
get_and_build_1  | Get:13 http://archive.ubuntu.com/ubuntu focal-updates/main amd64 libssl1.1 amd64 1.1.1f-1ubuntu2.1 [1319 kB]
get_and_build_1  | Get:14 http://archive.ubuntu.com/ubuntu focal/main amd64 libxml2 amd64 2.9.10+dfsg-5 [640 kB]
get_and_build_1  | Get:15 http://archive.ubuntu.com/ubuntu focal/main amd64 ucf all 3.0038+nmu1 [51.6 kB]
get_and_build_1  | Get:16 http://archive.ubuntu.com/ubuntu focal/main amd64 libpng16-16 amd64 1.6.37-2 [179 kB]
get_and_build_1  | Get:17 http://archive.ubuntu.com/ubuntu focal/main amd64 libxau6 amd64 1:1.0.9-0ubuntu1 [7488 B]
get_and_build_1  | Get:18 http://archive.ubuntu.com/ubuntu focal/main amd64 libxdmcp6 amd64 1:1.1.3-0ubuntu1 [10.6 kB]
get_and_build_1  | Get:19 http://archive.ubuntu.com/ubuntu focal/main amd64 libxcb1 amd64 1.14-2 [44.7 kB]
get_and_build_1  | Get:20 http://archive.ubuntu.com/ubuntu focal-updates/main amd64 libx11-data all 2:1.6.9-2ubuntu1.1 [113 kB]
get_and_build_1  | Get:21 http://archive.ubuntu.com/ubuntu focal-updates/main amd64 libx11-6 amd64 2:1.6.9-2ubuntu1.1 [574 kB]
get_and_build_1  | Get:22 http://archive.ubuntu.com/ubuntu focal/main amd64 fonts-dejavu-core all 2.37-1 [1041 kB]
get_and_build_1  | Get:23 http://archive.ubuntu.com/ubuntu focal/main amd64 fontconfig-config all 2.13.1-2ubuntu3 [28.8 kB]
get_and_build_1  | Get:24 http://archive.ubuntu.com/ubuntu focal-updates/main amd64 libfreetype6 amd64 2.10.1-2ubuntu0.1 [341 kB]
get_and_build_1  | Get:25 http://archive.ubuntu.com/ubuntu focal/main amd64 libfontconfig1 amd64 2.13.1-2ubuntu3 [114 kB]
get_and_build_1  | Get:26 http://archive.ubuntu.com/ubuntu focal-updates/main amd64 libjpeg-turbo8 amd64 2.0.3-0ubuntu1.20.04.1 [117 kB]
get_and_build_1  | Get:27 http://archive.ubuntu.com/ubuntu focal/main amd64 libjpeg8 amd64 8c-2ubuntu8 [2194 B]
get_and_build_1  | Get:28 http://archive.ubuntu.com/ubuntu focal/main amd64 libjbig0 amd64 2.1-3.1build1 [26.7 kB]
get_and_build_1  | Get:29 http://archive.ubuntu.com/ubuntu focal/main amd64 libwebp6 amd64 0.6.1-2 [185 kB]
get_and_build_1  | Get:30 http://archive.ubuntu.com/ubuntu focal/main amd64 libtiff5 amd64 4.1.0+git191117-2build1 [161 kB]
get_and_build_1  | Get:31 http://archive.ubuntu.com/ubuntu focal/main amd64 libxpm4 amd64 1:3.5.12-1 [34.0 kB]
get_and_build_1  | Get:32 http://archive.ubuntu.com/ubuntu focal/main amd64 libgd3 amd64 2.2.5-5.2ubuntu2 [118 kB]
get_and_build_1  | Get:33 http://archive.ubuntu.com/ubuntu focal-updates/main amd64 nginx-common all 1.18.0-0ubuntu1 [37.3 kB]
get_and_build_1  | Get:34 http://archive.ubuntu.com/ubuntu focal-updates/main amd64 libnginx-mod-http-image-filter amd64 1.18.0-0ubuntu1 [14.3 kB]
get_and_build_1  | Get:35 http://archive.ubuntu.com/ubuntu focal/main amd64 libxslt1.1 amd64 1.1.34-4 [152 kB]
get_and_build_1  | Get:36 http://archive.ubuntu.com/ubuntu focal-updates/main amd64 libnginx-mod-http-xslt-filter amd64 1.18.0-0ubuntu1 [12.6 kB]
get_and_build_1  | Get:37 http://archive.ubuntu.com/ubuntu focal-updates/main amd64 libnginx-mod-mail amd64 1.18.0-0ubuntu1 [42.3 kB]
get_and_build_1  | Get:38 http://archive.ubuntu.com/ubuntu focal-updates/main amd64 libnginx-mod-stream amd64 1.18.0-0ubuntu1 [66.9 kB]
get_and_build_1  | Get:39 http://archive.ubuntu.com/ubuntu focal-updates/main amd64 nginx-core amd64 1.18.0-0ubuntu1 [425 kB]
get_and_build_1  | Get:40 http://archive.ubuntu.com/ubuntu focal-updates/main amd64 nginx all 1.18.0-0ubuntu1 [3624 B]
get_and_build_1  | debconf: delaying package configuration, since apt-utils is not installed
get_and_build_1  | Fetched 15.8 MB in 3s (5190 kB/s)
get_and_build_1  | Selecting previously unselected package libbsd0:amd64.
(Reading database ... 4121 files and directories currently installed.)
get_and_build_1  | Preparing to unpack .../00-libbsd0_0.10.0-1_amd64.deb ...
get_and_build_1  | Unpacking libbsd0:amd64 (0.10.0-1) ...
get_and_build_1  | Selecting previously unselected package libcap2:amd64.
get_and_build_1  | Preparing to unpack .../01-libcap2_1%3a2.32-1_amd64.deb ...
get_and_build_1  | Unpacking libcap2:amd64 (1:2.32-1) ...
get_and_build_1  | Selecting previously unselected package libelf1:amd64.
get_and_build_1  | Preparing to unpack .../02-libelf1_0.176-1.1build1_amd64.deb ...
get_and_build_1  | Unpacking libelf1:amd64 (0.176-1.1build1) ...
get_and_build_1  | Selecting previously unselected package libmnl0:amd64.
get_and_build_1  | Preparing to unpack .../03-libmnl0_1.0.4-2_amd64.deb ...
get_and_build_1  | Unpacking libmnl0:amd64 (1.0.4-2) ...
get_and_build_1  | Selecting previously unselected package libxtables12:amd64.
get_and_build_1  | Preparing to unpack .../04-libxtables12_1.8.4-3ubuntu2_amd64.deb ...
get_and_build_1  | Unpacking libxtables12:amd64 (1.8.4-3ubuntu2) ...
get_and_build_1  | Selecting previously unselected package libcap2-bin.
get_and_build_1  | Preparing to unpack .../05-libcap2-bin_1%3a2.32-1_amd64.deb ...
get_and_build_1  | Unpacking libcap2-bin (1:2.32-1) ...
get_and_build_1  | Selecting previously unselected package iproute2.
get_and_build_1  | Preparing to unpack .../06-iproute2_5.5.0-1ubuntu1_amd64.deb ...
get_and_build_1  | Unpacking iproute2 (5.5.0-1ubuntu1) ...
get_and_build_1  | Selecting previously unselected package libatm1:amd64.
get_and_build_1  | Preparing to unpack .../07-libatm1_1%3a2.5.1-4_amd64.deb ...
get_and_build_1  | Unpacking libatm1:amd64 (1:2.5.1-4) ...
get_and_build_1  | Selecting previously unselected package libexpat1:amd64.
get_and_build_1  | Preparing to unpack .../08-libexpat1_2.2.9-1build1_amd64.deb ...
get_and_build_1  | Unpacking libexpat1:amd64 (2.2.9-1build1) ...
get_and_build_1  | Selecting previously unselected package tzdata.
get_and_build_1  | Preparing to unpack .../09-tzdata_2020d-0ubuntu0.20.04_all.deb ...
get_and_build_1  | Unpacking tzdata (2020d-0ubuntu0.20.04) ...
get_and_build_1  | Selecting previously unselected package libicu66:amd64.
get_and_build_1  | Preparing to unpack .../10-libicu66_66.1-2ubuntu2_amd64.deb ...
get_and_build_1  | Unpacking libicu66:amd64 (66.1-2ubuntu2) ...
get_and_build_1  | Selecting previously unselected package libpam-cap:amd64.
get_and_build_1  | Preparing to unpack .../11-libpam-cap_1%3a2.32-1_amd64.deb ...
get_and_build_1  | Unpacking libpam-cap:amd64 (1:2.32-1) ...
get_and_build_1  | Selecting previously unselected package libssl1.1:amd64.
get_and_build_1  | Preparing to unpack .../12-libssl1.1_1.1.1f-1ubuntu2.1_amd64.deb ...
get_and_build_1  | Unpacking libssl1.1:amd64 (1.1.1f-1ubuntu2.1) ...
get_and_build_1  | Selecting previously unselected package libxml2:amd64.
get_and_build_1  | Preparing to unpack .../13-libxml2_2.9.10+dfsg-5_amd64.deb ...
get_and_build_1  | Unpacking libxml2:amd64 (2.9.10+dfsg-5) ...
get_and_build_1  | Selecting previously unselected package ucf.
get_and_build_1  | Preparing to unpack .../14-ucf_3.0038+nmu1_all.deb ...
get_and_build_1  | Moving old data out of the way
get_and_build_1  | Unpacking ucf (3.0038+nmu1) ...
get_and_build_1  | Selecting previously unselected package libpng16-16:amd64.
get_and_build_1  | Preparing to unpack .../15-libpng16-16_1.6.37-2_amd64.deb ...
get_and_build_1  | Unpacking libpng16-16:amd64 (1.6.37-2) ...
get_and_build_1  | Selecting previously unselected package libxau6:amd64.
get_and_build_1  | Preparing to unpack .../16-libxau6_1%3a1.0.9-0ubuntu1_amd64.deb ...
get_and_build_1  | Unpacking libxau6:amd64 (1:1.0.9-0ubuntu1) ...
get_and_build_1  | Selecting previously unselected package libxdmcp6:amd64.
get_and_build_1  | Preparing to unpack .../17-libxdmcp6_1%3a1.1.3-0ubuntu1_amd64.deb ...
get_and_build_1  | Unpacking libxdmcp6:amd64 (1:1.1.3-0ubuntu1) ...
get_and_build_1  | Selecting previously unselected package libxcb1:amd64.
get_and_build_1  | Preparing to unpack .../18-libxcb1_1.14-2_amd64.deb ...
get_and_build_1  | Unpacking libxcb1:amd64 (1.14-2) ...
get_and_build_1  | Selecting previously unselected package libx11-data.
get_and_build_1  | Preparing to unpack .../19-libx11-data_2%3a1.6.9-2ubuntu1.1_all.deb ...
get_and_build_1  | Unpacking libx11-data (2:1.6.9-2ubuntu1.1) ...
get_and_build_1  | Selecting previously unselected package libx11-6:amd64.
get_and_build_1  | Preparing to unpack .../20-libx11-6_2%3a1.6.9-2ubuntu1.1_amd64.deb ...
get_and_build_1  | Unpacking libx11-6:amd64 (2:1.6.9-2ubuntu1.1) ...
get_and_build_1  | Selecting previously unselected package fonts-dejavu-core.
get_and_build_1  | Preparing to unpack .../21-fonts-dejavu-core_2.37-1_all.deb ...
get_and_build_1  | Unpacking fonts-dejavu-core (2.37-1) ...
get_and_build_1  | Selecting previously unselected package fontconfig-config.
get_and_build_1  | Preparing to unpack .../22-fontconfig-config_2.13.1-2ubuntu3_all.deb ...
get_and_build_1  | Unpacking fontconfig-config (2.13.1-2ubuntu3) ...
get_and_build_1  | Selecting previously unselected package libfreetype6:amd64.
get_and_build_1  | Preparing to unpack .../23-libfreetype6_2.10.1-2ubuntu0.1_amd64.deb ...
get_and_build_1  | Unpacking libfreetype6:amd64 (2.10.1-2ubuntu0.1) ...
get_and_build_1  | Selecting previously unselected package libfontconfig1:amd64.
get_and_build_1  | Preparing to unpack .../24-libfontconfig1_2.13.1-2ubuntu3_amd64.deb ...
get_and_build_1  | Unpacking libfontconfig1:amd64 (2.13.1-2ubuntu3) ...
get_and_build_1  | Selecting previously unselected package libjpeg-turbo8:amd64.
get_and_build_1  | Preparing to unpack .../25-libjpeg-turbo8_2.0.3-0ubuntu1.20.04.1_amd64.deb ...
get_and_build_1  | Unpacking libjpeg-turbo8:amd64 (2.0.3-0ubuntu1.20.04.1) ...
get_and_build_1  | Selecting previously unselected package libjpeg8:amd64.
get_and_build_1  | Preparing to unpack .../26-libjpeg8_8c-2ubuntu8_amd64.deb ...
get_and_build_1  | Unpacking libjpeg8:amd64 (8c-2ubuntu8) ...
get_and_build_1  | Selecting previously unselected package libjbig0:amd64.
get_and_build_1  | Preparing to unpack .../27-libjbig0_2.1-3.1build1_amd64.deb ...
get_and_build_1  | Unpacking libjbig0:amd64 (2.1-3.1build1) ...
get_and_build_1  | Selecting previously unselected package libwebp6:amd64.
get_and_build_1  | Preparing to unpack .../28-libwebp6_0.6.1-2_amd64.deb ...
get_and_build_1  | Unpacking libwebp6:amd64 (0.6.1-2) ...
get_and_build_1  | Selecting previously unselected package libtiff5:amd64.
get_and_build_1  | Preparing to unpack .../29-libtiff5_4.1.0+git191117-2build1_amd64.deb ...
get_and_build_1  | Unpacking libtiff5:amd64 (4.1.0+git191117-2build1) ...
get_and_build_1  | Selecting previously unselected package libxpm4:amd64.
get_and_build_1  | Preparing to unpack .../30-libxpm4_1%3a3.5.12-1_amd64.deb ...
get_and_build_1  | Unpacking libxpm4:amd64 (1:3.5.12-1) ...
get_and_build_1  | Selecting previously unselected package libgd3:amd64.
get_and_build_1  | Preparing to unpack .../31-libgd3_2.2.5-5.2ubuntu2_amd64.deb ...
get_and_build_1  | Unpacking libgd3:amd64 (2.2.5-5.2ubuntu2) ...
get_and_build_1  | Selecting previously unselected package nginx-common.
get_and_build_1  | Preparing to unpack .../32-nginx-common_1.18.0-0ubuntu1_all.deb ...
get_and_build_1  | Unpacking nginx-common (1.18.0-0ubuntu1) ...
get_and_build_1  | Selecting previously unselected package libnginx-mod-http-image-filter.
get_and_build_1  | Preparing to unpack .../33-libnginx-mod-http-image-filter_1.18.0-0ubuntu1_amd64.deb ...
get_and_build_1  | Unpacking libnginx-mod-http-image-filter (1.18.0-0ubuntu1) ...
get_and_build_1  | Selecting previously unselected package libxslt1.1:amd64.
get_and_build_1  | Preparing to unpack .../34-libxslt1.1_1.1.34-4_amd64.deb ...
get_and_build_1  | Unpacking libxslt1.1:amd64 (1.1.34-4) ...
get_and_build_1  | Selecting previously unselected package libnginx-mod-http-xslt-filter.
get_and_build_1  | Preparing to unpack .../35-libnginx-mod-http-xslt-filter_1.18.0-0ubuntu1_amd64.deb ...
get_and_build_1  | Unpacking libnginx-mod-http-xslt-filter (1.18.0-0ubuntu1) ...
get_and_build_1  | Selecting previously unselected package libnginx-mod-mail.
get_and_build_1  | Preparing to unpack .../36-libnginx-mod-mail_1.18.0-0ubuntu1_amd64.deb ...
get_and_build_1  | Unpacking libnginx-mod-mail (1.18.0-0ubuntu1) ...
get_and_build_1  | Selecting previously unselected package libnginx-mod-stream.
get_and_build_1  | Preparing to unpack .../37-libnginx-mod-stream_1.18.0-0ubuntu1_amd64.deb ...
get_and_build_1  | Unpacking libnginx-mod-stream (1.18.0-0ubuntu1) ...
get_and_build_1  | Selecting previously unselected package nginx-core.
get_and_build_1  | Preparing to unpack .../38-nginx-core_1.18.0-0ubuntu1_amd64.deb ...
get_and_build_1  | Unpacking nginx-core (1.18.0-0ubuntu1) ...
get_and_build_1  | Selecting previously unselected package nginx.
get_and_build_1  | Preparing to unpack .../39-nginx_1.18.0-0ubuntu1_all.deb ...
get_and_build_1  | Unpacking nginx (1.18.0-0ubuntu1) ...
get_and_build_1  | Setting up libexpat1:amd64 (2.2.9-1build1) ...
get_and_build_1  | Setting up libxau6:amd64 (1:1.0.9-0ubuntu1) ...
get_and_build_1  | Setting up libssl1.1:amd64 (1.1.1f-1ubuntu2.1) ...
get_and_build_1  | debconf: unable to initialize frontend: Dialog
get_and_build_1  | debconf: (TERM is not set, so the dialog frontend is not usable.)
get_and_build_1  | debconf: falling back to frontend: Readline
get_and_build_1  | debconf: unable to initialize frontend: Readline
get_and_build_1  | debconf: (Can't locate Term/ReadLine.pm in @INC (you may need to install the Term::ReadLine module) (@INC contains: /etc/perl /usr/local/lib/x86_64-linux-gnu/perl/5.30.0 /usr/local/share/perl/5.30.0 /usr/lib/x86_64-linux-gnu/perl5/5.30 /usr/share/perl5 /usr/lib/x86_64-linux-gnu/perl/5.30 /usr/share/perl/5.30 /usr/local/lib/site_perl /usr/lib/x86_64-linux-gnu/perl-base) at /usr/share/perl5/Debconf/FrontEnd/Readline.pm line 7.)
get_and_build_1  | debconf: falling back to frontend: Teletype
get_and_build_1  | Setting up nginx-common (1.18.0-0ubuntu1) ...
get_and_build_1  | debconf: unable to initialize frontend: Dialog
get_and_build_1  | debconf: (TERM is not set, so the dialog frontend is not usable.)
get_and_build_1  | debconf: falling back to frontend: Readline
get_and_build_1  | debconf: unable to initialize frontend: Readline
get_and_build_1  | debconf: (Can't locate Term/ReadLine.pm in @INC (you may need to install the Term::ReadLine module) (@INC contains: /etc/perl /usr/local/lib/x86_64-linux-gnu/perl/5.30.0 /usr/local/share/perl/5.30.0 /usr/lib/x86_64-linux-gnu/perl5/5.30 /usr/share/perl5 /usr/lib/x86_64-linux-gnu/perl/5.30 /usr/share/perl/5.30 /usr/local/lib/site_perl /usr/lib/x86_64-linux-gnu/perl-base) at /usr/share/perl5/Debconf/FrontEnd/Readline.pm line 7.)
get_and_build_1  | debconf: falling back to frontend: Teletype
get_and_build_1  | Setting up libatm1:amd64 (1:2.5.1-4) ...
get_and_build_1  | Setting up libjbig0:amd64 (2.1-3.1build1) ...
get_and_build_1  | Setting up libcap2:amd64 (1:2.32-1) ...
get_and_build_1  | Setting up tzdata (2020d-0ubuntu0.20.04) ...
get_and_build_1  | debconf: unable to initialize frontend: Dialog
get_and_build_1  | debconf: (TERM is not set, so the dialog frontend is not usable.)
get_and_build_1  | debconf: falling back to frontend: Readline
get_and_build_1  | debconf: unable to initialize frontend: Readline
get_and_build_1  | debconf: (Can't locate Term/ReadLine.pm in @INC (you may need to install the Term::ReadLine module) (@INC contains: /etc/perl /usr/local/lib/x86_64-linux-gnu/perl/5.30.0 /usr/local/share/perl/5.30.0 /usr/lib/x86_64-linux-gnu/perl5/5.30 /usr/share/perl5 /usr/lib/x86_64-linux-gnu/perl/5.30 /usr/share/perl/5.30 /usr/local/lib/site_perl /usr/lib/x86_64-linux-gnu/perl-base) at /usr/share/perl5/Debconf/FrontEnd/Readline.pm line 7.)
get_and_build_1  | debconf: falling back to frontend: Teletype
get_and_build_1  | Configuring tzdata
get_and_build_1  | ------------------
get_and_build_1  | 
get_and_build_1  | Please select the geographic area in which you live. Subsequent configuration
get_and_build_1  | questions will narrow this down by presenting a list of cities, representing
get_and_build_1  | the time zones in which they are located.
get_and_build_1  | 
get_and_build_1  |   1. Africa      4. Australia  7. Atlantic  10. Pacific  13. Etc
get_and_build_1  |   2. America     5. Arctic     8. Europe    11. SystemV
get_and_build_1  |   3. Antarctica  6. Asia       9. Indian    12. US
get_and_build_1  | Geographic area: 
get_and_build_1  | Use of uninitialized value $_[1] in join or string at /usr/share/perl5/Debconf/DbDriver/Stack.pm line 111.
get_and_build_1  | 
get_and_build_1  | Current default time zone: '/UTC'
get_and_build_1  | Local time is now:      Tue Dec 15 14:29:23 UTC 2020.
get_and_build_1  | Universal Time is now:  Tue Dec 15 14:29:23 UTC 2020.
get_and_build_1  | Run 'dpkg-reconfigure tzdata' if you wish to change it.
get_and_build_1  | 
get_and_build_1  | Use of uninitialized value $val in substitution (s///) at /usr/share/perl5/Debconf/Format/822.pm line 83, <GEN6> line 4.
get_and_build_1  | Use of uninitialized value $val in concatenation (.) or string at /usr/share/perl5/Debconf/Format/822.pm line 84, <GEN6> line 4.
get_and_build_1  | Setting up libcap2-bin (1:2.32-1) ...
get_and_build_1  | Setting up libx11-data (2:1.6.9-2ubuntu1.1) ...
get_and_build_1  | Setting up libpng16-16:amd64 (1.6.37-2) ...
get_and_build_1  | Setting up libmnl0:amd64 (1.0.4-2) ...
get_and_build_1  | Setting up libwebp6:amd64 (0.6.1-2) ...
get_and_build_1  | Setting up fonts-dejavu-core (2.37-1) ...
get_and_build_1  | Setting up ucf (3.0038+nmu1) ...
get_and_build_1  | debconf: unable to initialize frontend: Dialog
get_and_build_1  | debconf: (TERM is not set, so the dialog frontend is not usable.)
get_and_build_1  | debconf: falling back to frontend: Readline
get_and_build_1  | debconf: unable to initialize frontend: Readline
get_and_build_1  | debconf: (Can't locate Term/ReadLine.pm in @INC (you may need to install the Term::ReadLine module) (@INC contains: /etc/perl /usr/local/lib/x86_64-linux-gnu/perl/5.30.0 /usr/local/share/perl/5.30.0 /usr/lib/x86_64-linux-gnu/perl5/5.30 /usr/share/perl5 /usr/lib/x86_64-linux-gnu/perl/5.30 /usr/share/perl/5.30 /usr/local/lib/site_perl /usr/lib/x86_64-linux-gnu/perl-base) at /usr/share/perl5/Debconf/FrontEnd/Readline.pm line 7.)
get_and_build_1  | debconf: falling back to frontend: Teletype
get_and_build_1  | Setting up libjpeg-turbo8:amd64 (2.0.3-0ubuntu1.20.04.1) ...
get_and_build_1  | Setting up libxtables12:amd64 (1.8.4-3ubuntu2) ...
get_and_build_1  | Setting up libbsd0:amd64 (0.10.0-1) ...
get_and_build_1  | Setting up libelf1:amd64 (0.176-1.1build1) ...
get_and_build_1  | Setting up libpam-cap:amd64 (1:2.32-1) ...
get_and_build_1  | debconf: unable to initialize frontend: Dialog
get_and_build_1  | debconf: (TERM is not set, so the dialog frontend is not usable.)
get_and_build_1  | debconf: falling back to frontend: Readline
get_and_build_1  | debconf: unable to initialize frontend: Readline
get_and_build_1  | debconf: (Can't locate Term/ReadLine.pm in @INC (you may need to install the Term::ReadLine module) (@INC contains: /etc/perl /usr/local/lib/x86_64-linux-gnu/perl/5.30.0 /usr/local/share/perl/5.30.0 /usr/lib/x86_64-linux-gnu/perl5/5.30 /usr/share/perl5 /usr/lib/x86_64-linux-gnu/perl/5.30 /usr/share/perl/5.30 /usr/local/lib/site_perl /usr/lib/x86_64-linux-gnu/perl-base) at /usr/share/perl5/Debconf/FrontEnd/Readline.pm line 7.)
get_and_build_1  | debconf: falling back to frontend: Teletype
get_and_build_1  | Setting up libjpeg8:amd64 (8c-2ubuntu8) ...
get_and_build_1  | Setting up libnginx-mod-mail (1.18.0-0ubuntu1) ...
get_and_build_1  | Setting up libxdmcp6:amd64 (1:1.1.3-0ubuntu1) ...
get_and_build_1  | Setting up libxcb1:amd64 (1.14-2) ...
get_and_build_1  | Setting up fontconfig-config (2.13.1-2ubuntu3) ...
get_and_build_1  | Setting up iproute2 (5.5.0-1ubuntu1) ...
get_and_build_1  | debconf: unable to initialize frontend: Dialog
get_and_build_1  | debconf: (TERM is not set, so the dialog frontend is not usable.)
get_and_build_1  | debconf: falling back to frontend: Readline
get_and_build_1  | debconf: unable to initialize frontend: Readline
get_and_build_1  | debconf: (Can't locate Term/ReadLine.pm in @INC (you may need to install the Term::ReadLine module) (@INC contains: /etc/perl /usr/local/lib/x86_64-linux-gnu/perl/5.30.0 /usr/local/share/perl/5.30.0 /usr/lib/x86_64-linux-gnu/perl5/5.30 /usr/share/perl5 /usr/lib/x86_64-linux-gnu/perl/5.30 /usr/share/perl/5.30 /usr/local/lib/site_perl /usr/lib/x86_64-linux-gnu/perl-base) at /usr/share/perl5/Debconf/FrontEnd/Readline.pm line 7.)
get_and_build_1  | debconf: falling back to frontend: Teletype
get_and_build_1  | Setting up libicu66:amd64 (66.1-2ubuntu2) ...
get_and_build_1  | Setting up libnginx-mod-stream (1.18.0-0ubuntu1) ...
get_and_build_1  | Setting up libfreetype6:amd64 (2.10.1-2ubuntu0.1) ...
get_and_build_1  | Setting up libx11-6:amd64 (2:1.6.9-2ubuntu1.1) ...
get_and_build_1  | Setting up libtiff5:amd64 (4.1.0+git191117-2build1) ...
get_and_build_1  | Setting up libfontconfig1:amd64 (2.13.1-2ubuntu3) ...
get_and_build_1  | Setting up libxml2:amd64 (2.9.10+dfsg-5) ...
get_and_build_1  | Setting up libxpm4:amd64 (1:3.5.12-1) ...
get_and_build_1  | Setting up libgd3:amd64 (2.2.5-5.2ubuntu2) ...
get_and_build_1  | Setting up libxslt1.1:amd64 (1.1.34-4) ...
get_and_build_1  | Setting up libnginx-mod-http-image-filter (1.18.0-0ubuntu1) ...
get_and_build_1  | Setting up libnginx-mod-http-xslt-filter (1.18.0-0ubuntu1) ...
get_and_build_1  | Setting up nginx-core (1.18.0-0ubuntu1) ...
get_and_build_1  | invoke-rc.d: could not determine current runlevel
get_and_build_1  | invoke-rc.d: policy-rc.d denied execution of start.
get_and_build_1  | Setting up nginx (1.18.0-0ubuntu1) ...
get_and_build_1  | Processing triggers for libc-bin (2.31-0ubuntu9.1) ...
get_and_build_1  | Removing intermediate container 068f9e5b612b
get_and_build_1  |  ---> 39bdb144c70f
get_and_build_1  | Step 4/9 : WORKDIR /usr/app
get_and_build_1  |  ---> Running in 6e79d97b5ffe
get_and_build_1  | Removing intermediate container 6e79d97b5ffe
get_and_build_1  |  ---> 9cbb81bbce8f
get_and_build_1  | Step 5/9 : COPY ./sh_html.sh .
get_and_build_1  |  ---> 6d3888d4b66d
get_and_build_1  | Step 6/9 : RUN chmod +x sh_html.sh
get_and_build_1  |  ---> Running in 892a9d81e207
get_and_build_1  | Removing intermediate container 892a9d81e207
get_and_build_1  |  ---> 97fc2be7ba8d
get_and_build_1  | Step 7/9 : RUN ./sh_html.sh > /var/www/html/index.html
get_and_build_1  |  ---> Running in f220112fe9db
get_and_build_1  | Removing intermediate container f220112fe9db
get_and_build_1  |  ---> b06ae566e8a2
get_and_build_1  | Step 8/9 : EXPOSE 80
get_and_build_1  |  ---> Running in f0f56f668e6c
get_and_build_1  | Removing intermediate container f0f56f668e6c
get_and_build_1  |  ---> 5bcd4fb0e60d
get_and_build_1  | Step 9/9 : CMD ["nginx","-g","daemon off;"]
get_and_build_1  |  ---> Running in dc2e736dd098
get_and_build_1  | Removing intermediate container dc2e736dd098
get_and_build_1  |  ---> 929f4354fdb2
get_and_build_1  | Successfully built 929f4354fdb2
get_and_build_1  | Successfully tagged dmitri9149/staticpage:latest
get_and_build_1  | start login
get_and_build_1  | WARNING! Using --password via the CLI is insecure. Use --password-stdin.
get_and_build_1  | WARNING! Your password will be stored unencrypted in /root/.docker/config.json.
get_and_build_1  | Configure a credential helper to remove this warning. See
get_and_build_1  | https://docs.docker.com/engine/reference/commandline/login/#credentials-store
get_and_build_1  | 
get_and_build_1  | Login Succeeded
get_and_build_1  | The push refers to repository [docker.io/dmitri9149/staticpage]
get_and_build_1  | 4504399bc985: Preparing
get_and_build_1  | 4d4376fdedf9: Preparing
get_and_build_1  | 4d4376fdedf9: Preparing
get_and_build_1  | e2ce2c67326e: Preparing
get_and_build_1  | 61c98073dd01: Preparing
get_and_build_1  | 655beddd8a79: Preparing
get_and_build_1  | f6253634dc78: Preparing
get_and_build_1  | 9069f84dbbe9: Preparing
get_and_build_1  | bacd3af13903: Preparing
get_and_build_1  | f6253634dc78: Waiting
get_and_build_1  | 9069f84dbbe9: Waiting
get_and_build_1  | bacd3af13903: Waiting
get_and_build_1  | 4d4376fdedf9: Pushed
get_and_build_1  | e2ce2c67326e: Pushed
get_and_build_1  | 4504399bc985: Pushed
get_and_build_1  | f6253634dc78: Layer already exists
get_and_build_1  | 9069f84dbbe9: Layer already exists
get_and_build_1  | bacd3af13903: Layer already exists
get_and_build_1  | 655beddd8a79: Pushed
get_and_build_1  | 61c98073dd01: Pushed
get_and_build_1  | latest: digest: sha256:ad7eb3eafb48efd633170db51affc8a5732ad4511ae23786bd747b49adcd962b size: 2195
ex_33_get_and_build_1 exited with code 0
~>/ex_3.3$ ~```   
->-----------------------------------------------------------------     
3.4
This exercise is mandatory

Security issues with the user being a root are serious for the example frontend and backend as the containers for web services are supposed to be accessible through the internet.

Make sure the containers start their processes as a non-root user.

TIP man chown may help you if you have access errors.   
->---------------------------------------------------------------     

See ex_3.4/front and ex_3.4/back   Dockerfiles   
->--------------------------------------------------------    
->----------------------------------------------------------      
3.5
Document the image size before the changes.

Rather than going to FROM alpine or scratch, lets go look into docker-node and we should find a way how to run a container that has everything pre-installed for us. There’s even a best practices guide

Return back to our frontend & backend Dockerfiles and change the FROM to something more suitable. Make sure the application still works after the changes.

Document the size after this change. If you used the alpine version the size for frontend can be less than 250MB. The backend can be below 150MB.   
->-------------------------------------------------------------   

See ex_3.5 folder README.md   

->------------------------------------------------------------------     
->--------------------------------------------------------------------     

3.6
Multi-stage builds. Lets do a multi-stage build for the frontend project since we’ve come so far with the application.

Even though multi-stage builds are designed mostly for binaries in mind, we can leverage the benefits with our frontend project as having original source code with the final assets makes little sense. Build it with the instructions in README and the built assets should be in dist folder.

You can still use the serve to serve the static files or try out something else.   
->--------------------------------------------------------------------    

See README.md ex_3.6

->----------------------------------------------------------------------------  
->------------------------------------------------------------------------------  
3.7
Do all or most of the optimizations from security to size for any other Dockerfile you have access to, in your own project or for example the ones used in previous “standalone” exercises. Please document Dockerfiles both before and after.

See README.md ex_3.7   

->--------------------------------------------------------------------   
->----------------------------------------------------------------------   
3.8 Kubernetes
Familiarize yourself with Kubernetes terminology and draw a diagram.

Similarly to the networking diagrams in part 2. You will need to draw a diagram of at least three host machines in a Kubernetes cluster. The cluster is running two applications. The applications can be anything you want. An example could be a videogame server and a blog website.

The applications may utilize other machines or APIs that are not part of the cluster. At least three of the machines should be utilized. Include “your own computer” in the diagram as the one sending instructions via kubectl to deploy an application. In addition include a HTTP message coming from the internet to your Kubernetes cluster and how it may reach an application.

Make sure to label the diagram so that anyone else who has completed this exercise, and read the glossary, would undestand it. The diagram should contain at least four of the following labels: Pod, Cluster, Container, Service and a Volume.

Glossary. And some helpful diagrams

I prefer to use draw.io but you can use whichever tool you want.   

->----------------------------------------------------------------------------  
See https://github.com/Dmitri9149/DevOps-with-Docker-2020-part3/blob/master/Kubernets_picture.ipynb  in this repository.

(or Kubernetes.png file in ex_3.8 folder) 

->--------------------------------------------------------    

