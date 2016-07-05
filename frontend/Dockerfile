FROM node:6.2

ENV INSTALL_PATH /frontend
RUN mkdir -p $INSTALL_PATH

WORKDIR $INSTALL_PATH

# Copy package.json separately so it's recreated when package.json
# changes.
COPY package.json ./package.json
RUN npm install
COPY . $INSTALL_PATH
RUN npm  install -g phantomjs bower ember-cli ;\
    bower --allow-root install

EXPOSE 4200
EXPOSE 49152

CMD [ "ember", "server" ]
