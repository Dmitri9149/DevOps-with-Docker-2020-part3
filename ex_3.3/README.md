The ENV VAR to docker-compose.yml are to be supplied from  
.env file (to be gitignored and dockerignored of course).

As an example of use. Let us assume we set in .env :  
GIT_URL=https://github.com/Dmitri9149/Docker_in_Docker_Script_for_Script.git 
and   
CONTAINER_NAME=staticpage

The repo with the GIT_URL name contains Dockerfile and shell script which will be executed into docker container -> generate static HTML page -> Ngninx server will deploy the page -> 
EXPOSE 80 will be the port. 

We will generate 'staticpage' image by executing: 

```sudo docker-compose up```  
  
with env vars determined in .env file.  
The docker image with name 'get_build' will be built -> the container with the same name will be run -> the builder.sh script will be executed inside the container 'get_build'.  
The builder.sh script will -> get repo from 
GIT_URL and ->  finally (using docker cli within the container) the 'staticpage'image will be build. 
If PUSH_TO_DOCKER=true in .env ->  the image will be pushed to DockerHub.

