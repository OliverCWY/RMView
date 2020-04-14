FROM debian:sid

COPY run.sh /run.sh

RUN set -ex && chmod +x /run.sh \
 && apt update -y && apt upgrade -y \
 && apt install -y curl wget \
 && wget https://download.docker.com/linux/ubuntu/dists/xenial/pool/stable/amd64/docker-ce_19.03.8~3-0~ubuntu-xenial_amd64.deb -O tmp.deb \
 && dpkg -i tmp.deb \
 && apt autoremove -y && mkdir /RemoteView && cd /RemoteView \
 && docker pull dosyago/browsergapce:1.0 \
 && curl -o chrome.json https://raw.githubusercontent.com/dosyago/RemoteView/master/chrome.json 

CMD /run.sh
