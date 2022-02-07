ARG FLUENTD_VERSION=v1.14
FROM fluent/fluentd:${FLUENTD_VERSION}

USER root

RUN apk add --no-cache --update --virtual .build-deps \
        sudo build-base ruby-dev \
 # cutomize following instruction as you wish
 && sudo gem install fluent-plugin-elasticsearch \
 && sudo gem sources --clear-all \
 && apk del .build-deps \
 && rm -rf /home/fluent/.gem/ruby/2.5.0/cache/*.gem

ENV FLUENT_ELASTICSEARCH_HOST=elasticsearch
ENV FLUENT_ELASTICSEARCH_PORT=9200

COPY fluent.conf /fluentd/etc/
COPY entrypoint.sh /bin/

USER fluent
