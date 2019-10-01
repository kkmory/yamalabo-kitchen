FROM alpine

ARG GLIBC_VERSION=2.29-r0
ARG BITCOIN_CORE_VERSION
ARG BITCOIN_DIR
ARG BITCOIN_CONF
ARG DOWNLOAD_URL

RUN apk update \
  && apk --no-cache add wget tar bash ca-certificates \
  && wget -q -O /etc/apk/keys/sgerrand.rsa.pub https://alpine-pkgs.sgerrand.com/sgerrand.rsa.pub \
  && wget https://github.com/sgerrand/alpine-pkg-glibc/releases/download/${GLIBC_VERSION}/glibc-${GLIBC_VERSION}.apk \
  && wget https://github.com/sgerrand/alpine-pkg-glibc/releases/download/${GLIBC_VERSION}/glibc-bin-${GLIBC_VERSION}.apk \
  && apk --no-cache add glibc-${GLIBC_VERSION}.apk \
  && apk --no-cache add glibc-bin-${GLIBC_VERSION}.apk \
  && rm -rf /glibc-${GLIBC_VERSION}.apk \
  && rm -rf /glibc-bin-${GLIBC_VERSION}.apk

RUN wget $DOWNLOAD_URL \
  && tar xzvf /bitcoin-0.18.1-x86_64-linux-gnu.tar.gz \
  && mkdir /root/.bitcoin \
  && mv /bitcoin-0.18.1/bin/* /usr/local/bin/ \
  && rm -rf /bitcoin-0.18.1/ \
  && rm -rf /bitcoin-0.18.1-x86_64-linux-gnu.tar.gz \
  && apk del tar wget ca-certificates

EXPOSE 8332 8333 18332 18333 28332 28333

ADD ./entrypoint.sh /usr/local/bin/docker_entrypoint.sh
RUN chmod a+x /usr/local/bin/docker_entrypoint.sh

ENTRYPOINT ["/usr/local/bin/docker_entrypoint.sh"]
