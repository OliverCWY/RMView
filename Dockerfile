FROM debian:sid

COPY run.sh /run.sh
COPY setup.sh /setup.sh

RUN sh /setup.sh

CMD sh /run.sh