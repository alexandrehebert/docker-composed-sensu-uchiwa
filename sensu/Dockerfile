FROM ubuntu

# sensu core and dependencies
RUN apt-get update
RUN apt-get install -y wget
RUN wget -q "http://repositories.sensuapp.org/apt/pubkey.gpg" -O- | apt-key add -
RUN echo "deb     http://repositories.sensuapp.org/apt sensu main" | tee /etc/apt/sources.list.d/sensu.list
RUN apt-get update
RUN apt-get install -y sensu

# sensu default configuration
COPY config.json /etc/sensu/config.json

# sensu client
COPY check-memory/client.json /etc/sensu/conf.d/client.json
COPY check-memory/handler.json /etc/sensu/conf.d/default_handler.json
COPY check-memory/check-memory.sh /etc/sensu/plugins/check-memory.sh
COPY check-memory/check-memory.json /etc/sensu/conf.d/check-memory.json
RUN chmod +x /etc/sensu/plugins/check-memory.sh

# small fixes
RUN chown -R sensu:sensu /etc/sensu

# sensu start services
RUN update-rc.d sensu-server defaults
RUN update-rc.d sensu-api defaults
RUN update-rc.d sensu-client defaults

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh
ENTRYPOINT ["sudo", "/entrypoint.sh"]