FROM debian:sid

COPY run.sh /run.sh
COPY setup.sh /setup.sh

RUN set -ex && sh /setup.sh

CMD sh /run.sh