FROM gilesknap/gphotos-sync:latest

RUN apt-get update && apt-get -y install cron

ENV SCHEDULE="0 */8 * * *"
ENV SCHEDULE_CMD="/usr/local/bin/gphotos-sync --secret /config/client_secret.json /storage"

ADD https://github.com/just-containers/s6-overlay/releases/download/v1.21.8.0/s6-overlay-amd64.tar.gz /tmp/
RUN tar xzf /tmp/s6-overlay-amd64.tar.gz -C / && rm -rf /tmp/*

COPY rootfs/ /

VOLUME ["/config", "/storage"]
ENTRYPOINT ["/init"]
