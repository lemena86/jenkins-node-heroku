FROM acrisliu/jenkins-nodejs

# Switch to root user
USER root

RUN apk --no-cache update && apk --no-cache add g++ make bash zlib-dev libpng-dev &&  rm -fr /var/cache/apk/*

RUN npm install -g pngquant-bin --allow-root  --unsafe-perm=true
RUN npm install -g heroku

# Switch to jenkins user
USER jenkins