FROM debian:trixie-slim

# Installer Squid
RUN apt-get update && apt-get install -y squid && rm -rf /var/lib/apt/lists/*

# Copier scripts et run.sh
COPY run.sh /run.sh
COPY updateEasyList.sh /updateEasyList.sh
COPY updateAdServersList.sh /updateAdServersList.sh
RUN chmod +x /run.sh /updateAdServersList.sh /updateEasyList.sh

# Copier configs Git
COPY conf /addon/conf
COPY conf.d /addon/conf.d

# Exposer port Squid
EXPOSE 3128

CMD ["/run.sh"]
