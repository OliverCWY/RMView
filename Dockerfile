FROM debian:sid

COPY run.sh /run.sh
COPY setup.sh /setup.sh

RUN set -ex && chmod +x /setup.sh && /setup.sh && chmod +x /run.sh

CMD /run.sh