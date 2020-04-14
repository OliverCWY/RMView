cd /RemoteView
docker run -d -p ${PORT}:8002 --security-opt seccomp=$(pwd)/chrome.json browsergapce:1.0