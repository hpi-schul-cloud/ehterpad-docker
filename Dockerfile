FROM docker.io/etherpad/etherpad:1.8.14

USER root

RUN apt-get update \
    && apt-get upgrade -y \
    && apt-get install -y patch \
    && rm -rf /var/lib/apt/lists/*

COPY 0001-default-settings-changed.patch /tmp

RUN patch --verbose /opt/etherpad-lite/settings.json /tmp/0001-default-settings-changed.patch

# switching back to etherpad user
USER etherpad
