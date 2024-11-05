ARG FLUENTD_VERSION=v1.17.1-1.0
FROM fluent/fluentd:${FLUENTD_VERSION}

USER root

RUN apk add --no-cache --update --virtual .build-deps \
        sudo build-base ruby-dev && \
    fluent-gem install fluent-plugin-opensearch && \
    fluent-gem install fluent-plugin-wodby --version=">=0.1.8" && \
    gem sources --clear-all && \
    apk del .build-deps && \
    rm -rf /home/fluent/.gem/ruby/2.5.0/cache/*.gem

ENV FLUENT_OPENSEARCH_HOST=opensearch
ENV FLUENT_OPENSEARCH_PORT=9200

COPY fluent.conf /fluentd/etc/
COPY entrypoint.sh /bin/

USER fluent
