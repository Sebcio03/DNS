FROM node:16.15-alpine
 
WORKDIR /usr/src/app
 
ENV PATH /usr/src/app/node_modules/.bin:$PATH
 
COPY ["package.json", "package-lock.json", "./"]
 
RUN npm install
RUN npm install -g @angular/cli
RUN npm install --save-dev @angular-devkit/build-angular
 
COPY . .
 
CMD ng serve --host 0.0.0.0 --port 80

EXPOSE 80