The ENV VAR to docker-compose.yml are to be supplied from  
.env file (to be gitignored and dockerignored of course).

As an example of use. Let us assume  
GIT_URL=https://github.com/Dmitri9149/Docker_in_Docker_Script_for_Script.git 

That repo contains Dockerfile and shell script which will be executed into the docker container -> generate static HTML page -> Ngninx server will deploy the page -> 
EXPOSE 80 will be the port.
