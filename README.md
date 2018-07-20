# jenkins-node-heroku
docker image with jenkins, node and heroku

0. crear container
 docker build -t custom-jenkins .

1. Iniciar el container
docker run -p 8080:8080 -p 50000:50000 custom-jenkins

2. crear las llaves en el container de docker para que se pueda conectar a heroku
  docker exec -it custom-jenkins bash
  ssh-keygen -t rsa
  heroku login
  heroku create
  heroku keys:add

3. Instalar plugin de nodejs en jenkins

4. crear las credencias
	github
	heroku (con ssh keys)
	
5. crear la tarea
	 mapear el repositorio de github
	 mapear el repositorio de heroku, nombre remoto heroku con las credenciales de heroku
	 
6. crear comando para instalar y test
	npm install
	npm run test

7. crear una tarea de post build
  Git publisher
  Branch to push: refs/heads/master
  Target remote name: heroku



en caso que no funcione el git publisher
comando para el despliegue desde github a heroku
# deal with remote
echo "Checking if remote exists..."
if ! git ls-remote heroku; then
  echo "Adding heroku remote..."
  git remote add heroku git@heroku.com:grancar.git
fi

# push only origin/master to heroku/master - will do nothing if
# master doesn't change.
echo "Updating heroku master branch..."
git push heroku origin/master:refs/heads/master
