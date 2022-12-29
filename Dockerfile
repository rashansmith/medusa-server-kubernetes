FROM node:latest

WORKDIR /usr/src/app/medusa

COPY package.json .
COPY develop.sh .
#COPY yarn.* .

RUN apt-get update

RUN apt-get install -y python

RUN npm install -g npm@latest

RUN npm install -g @medusajs/medusa-cli@latest

RUN npm install --log-level=error

COPY . .

EXPOSE 9000

RUN chmod +x develop.sh

ENTRYPOINT ["sh", "develop.sh"]
