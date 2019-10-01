FROM alpine

ARG GLIBC_VERSION=2.29-r0

ENV FILENAME bitcoin-${BITCOIN_CORE_VERSION}-x86_64-linux-gnu.tar.gz
ENV DOWNLOAD_URL https://bitcoin.org/bin/bitcoin-core-${BITCOIN_CORE_VERSION}/${FILENAME}

RUN apk update \
  && apk --no-cache add wget tar bash ca-certificates \
  && wget -q -O /etc/apk/keys/sgerrand.rsa.pub https://alpine-pkgs.sgerrand.com/sgerrand.rsa.pub \
  && wget https://github.com/sgerrand/alpine-pkg-glibc/releases/download/${GLIBC_VERSION}/glibc-${GLIBC_VERSION}.apk \
  && wget https://github.com/sgerrand/alpine-pkg-glibc/releases/download/${GLIBC_VERSION}/glibc-bin-${GLIBC_VERSION}.apk \
  && apk --no-cache add glibc-${GLIBC_VERSION}.apk \
  && apk --no-cache add glibc-bin-${GLIBC_VERSION}.apk \
  && rm -rf /glibc-${GLIBC_VERSION}.apk \
  && rm -rf /glibc-bin-${GLIBC_VERSION}.apk \
  && wget $DOWNLOAD_URL \
  && tar xzvf /bitcoin-${BITCOIN_CORE_VERSION}-x86_64-linux-gnu.tar.gz \
  && mkdir /root/.bitcoin \
  && mv /bitcoin-${BITCOIN_CORE_VERSION}/bin/* /usr/local/bin/ \
  && rm -rf /bitcoin-${BITCOIN_CORE_VERSION}/ \
  && rm -rf /bitcoin-${BITCOIN_CORE_VERSION}-x86_64-linux-gnu.tar.gz \
  && apk del tar wget ca-certificates

EXPOSE 8332 8333 18332 18333 28332 28333

ADD BITCOIN_CORE_VERSION .
ADD ./bin/docker_entrypoint.sh /usr/local/bin/docker_entrypoint.sh
RUN chmod a+x /usr/local/bin/docker_entrypoint.sh

ENTRYPOINT ["/usr/local/bin/docker_entrypoint.sh"]
