cd /RemoteView
docker pull dosyago/browsergapce:1.0
curl -o chrome.json https://raw.githubusercontent.com/dosyago/RemoteView/master/chrome.json
echo 'kernel.unprivileged_userns_clone=1' > /etc/sysctl.d/00-local-userns.conf
echo 'net.ipv4.ip_forward=1' > /etc/sysctl.d/01-network-ipv4.conf
sysctl -p