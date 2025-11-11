ARG FLUENTD_VERSION=v1.19.0-1.0
FROM fluent/fluentd:${FLUENTD_VERSION}

USER root

RUN apt update && \
    apt install -y ruby-dev && \
    fluent-gem install fluent-plugin-opensearch && \
    fluent-gem install fluent-plugin-wodby && \
    apt purge -y ruby-dev && \
    apt autoremove --purge -y && \
    rm -rf /var/lib/apt/*

ENV FLUENT_OPENSEARCH_HOST=opensearch
ENV FLUENT_OPENSEARCH_PORT=9200

COPY fluent.conf /fluentd/etc/
COPY entrypoint.sh /bin/

USER fluent
