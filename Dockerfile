FROM ghcr.io/linuxserver/baseimage-kasmvnc:alpine318

# set version label
ARG BUILD_DATE
ARG VERSION
LABEL build_version="Linuxserver.io version:- ${VERSION} Build-date:- ${BUILD_DATE}"
LABEL maintainer="thelamer"

# title
ENV TITLE=Chromium

RUN \
  echo "**** install packages ****" && \
  apk add --no-cache \
    chromium npm && \
  echo "**** cleanup ****" && \
  rm -rf \
    /tmp/*

# add local files
COPY /root /

WORKDIR /defaults/proxy

RUN npm install http-proxy --save

CMD [ "node", "proxy.js" ]

# ports and volumes
EXPOSE 3000
EXPOSE 9222

VOLUME /config
