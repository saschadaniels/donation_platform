# README

**Development installation**

1. Install docker
2. Get docker-compose
3. Clone repo
4. Run "docker-compose build"
5. Run "docker-compose up"
6. Point your browser to http://localhost:3000

You do NOT need any local ruby installation. In development mode the code will be bind mounted and the database will be an sqlite3 file in db/.
Code changes can be made locally with the IDE of your choice.

**Running rails or rake commands**

All required rails commands must be run inside of the running docker container.
1. Run "docker ps" and get your container ID
2. Run "docker exec -it $CONTAINER_ID bash"
3. Run your rails commands like "rails generate scaffold ...."

There is one downside on Linux hosts! Files generated within the container will be owned by "root", causing issues when committing them.

Solution: run "./fix_filesystem.sh" on your local machine before committing.

**Database migrations**

Database changes via migrations will be automatically performed at each container start via "rake db:migrate". You can run the command directly from inside the container as well.


