apt-get update
apt-get upgrade
apt-get -y install apt-transport-https ca-certificates curl gnupg-agent software-properties-common
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | apt-key add -
add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
apt-get update
apt-get install docker-ce docker-ce-cli containerd.io
mkdir /RemoteView
cd /RemoteView
docker pull dosyago/browsergapce:1.0
curl -o chrome.json https://raw.githubusercontent.com/dosyago/RemoteView/master/chrome.json 
