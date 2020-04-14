cd /
apt update
apt -y upgrade
apt install -y curl git wget nodejs npm
git clone https://github.com/dosyago/RemoteView
cd RemoteView
./setup_machine.sh