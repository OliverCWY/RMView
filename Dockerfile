FROM debian:sid

COPY run.sh /run.sh
COPY setup.sh /setup.sh

RUN /setup.sh

CMD /run.sh