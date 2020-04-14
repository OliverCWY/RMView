FROM debian:sid

COPY run.sh /run.sh

RUN set -ex && chmod +x /run.sh \
 && apt update -y && apt upgrade -y \
 && apt install -y apt-transport-https ca-certificates curl gnupg-agent software-properties-common \
 && curl -fsSL https://download.docker.com/linux/ubuntu/gpg | apt-key add - \
 && add-apt-repository deb [arch=amd64] https://download.docker.com/linux/ubuntu xenial stable" \
 && apt update -y && apt install -y docker-ce docker-ce-cli containerd.io \
 && apt autoremove -y && mkdir /RemoteView && cd /RemoteView \
 && docker pull dosyago/browsergapce:1.0 \
 && curl -o chrome.json https://raw.githubusercontent.com/dosyago/RemoteView/master/chrome.json 

CMD /run.sh
