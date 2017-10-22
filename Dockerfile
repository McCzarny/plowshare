
FROM armhf/alpine
MAINTAINER mcczarny@gmail.com

RUN packages=' \
    bash \
    vim \
    git \
    tar \
    curl \
    wget \
    make \
    unrar \
    aria2 \
  ' \
  set -x \
  && apk --update add $packages \
  && rm -rf /var/cache/apk/*

WORKDIR /opt/ 
RUN git clone https://github.com/mcrapet/plowshare
RUN cd plowshare && make install
RUN plowmod --install

VOLUME [ /scripts, /downloads ]

CMD ["sh"]
