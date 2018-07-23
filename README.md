# jenkins-node-heroku

Docker image with jenkins, node and heroku

### Installing

 Crear container
 
 ```
 docker build -t custom-jenkins .
 ```
 
 Iniciar el container
 
 ```
 docker run -p 8080:8080 -p 50000:50000 custom-jenkins
 ```

 Para listar los container

 ``` 
 docker ps -a
 ``` 

 Crear las llaves en el container de docker para que se pueda conectar a heroku
  
 ``` 
 docker exec -it ${container-id} bash
 ssh-keygen -t rsa
 heroku login
 heroku keys:add
 ```

 Crear las credenciales en jenkins para:
 
 ```
 github
 heroku (con ssh keys y el id heroku-login)
 ```

 Configurar gmail
 ```
 Gmail SMTP server address: smtp.gmail.com
 Gmail SMTP user name: Your full Gmail address (e.g. example@gmail.com)
 Gmail SMTP password: Your Gmail password
 Gmail SMTP port: 465
 Gmail SMTP TLS/SSL required: yes
 ```

## Para una pipeline

* **Crear un multibranch pipeline**
* **Conectar github con el pipeline**





## Para una tarea (TODO)
 Instalar plugin de nodejs en jenkins

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

deal with remote
echo "Checking if remote exists..."
if ! git ls-remote heroku; then
  echo "Adding heroku remote..."
  git remote add heroku git@heroku.com:grancar.git
fi

push only origin/master to heroku/master - will do nothing if master doesn't change.
echo "Updating heroku master branch..."
git push heroku origin/master:refs/heads/master
