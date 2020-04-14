FROM debian:sid

COPY run.sh /run.sh

RUN set -ex && chmod +x /run.sh \
 && apt update -y && apt upgrade -y \
 && apt install -y curl wget iptables libdevmapper1.02.1\
 && wget https://download.docker.com/linux/ubuntu/dists/xenial/pool/stable/amd64/docker-ce-cli_19.03.8~3-0~ubuntu-xenial_amd64.deb -O 1.deb \
 && dpkg -i 1.deb \
 && wget https://download.docker.com/linux/ubuntu/dists/xenial/pool/stable/amd64/containerd.io_1.2.13-1_amd64.deb -O 2.deb \
 && dpkg -i 2.deb \
 && wget https://download.docker.com/linux/ubuntu/dists/xenial/pool/stable/amd64/docker-ce_19.03.8~3-0~ubuntu-xenial_amd64.deb -O 3.deb \
 && dpkg -i 3.deb \
 && apt autoremove -y && mkdir /RemoteView && cd /RemoteView \
 && docker pull dosyago/browsergapce:1.0 \
 && curl -o chrome.json https://raw.githubusercontent.com/dosyago/RemoteView/master/chrome.json 

CMD /run.sh
