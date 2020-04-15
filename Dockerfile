FROM debian:sid

COPY run.sh /run.sh

RUN set -ex && chmod +x /run.sh \
 && apt update -y && apt upgrade -y \
 && apt install -y curl git wget curl apt-utils nodejs npm \
 && npm install node-dev is-docker sharp rimraf lighthouse-logger \
 && cd / && git clone https://github.com/dosyago/RemoteView \
 && cd RemoteView/zombie-lord \
 && apt-get install -y pulseaudio pulseaudio-utils lame \
 && apt-get install -y gconf-service libasound2 libatk1.0-0 libc6 libcairo2 libcups2 libdbus-1-3 libexpat1 libfontconfig1 libgcc1 libgconf-2-4 libgdk-pixbuf2.0-0 libglib2.0-0 libgtk-3-0 libnspr4 libpango-1.0-0 libpangocairo-1.0-0 libstdc++6 libx11-6 libx11-xcb1 libxcb1 libxcomposite1 libxcursor1 libxdamage1 libxext6 libxfixes3 libxi6 libxrandr2 libxrender1 libxss1 libxtst6 ca-certificates fonts-liberation libappindicator1 libnss3 lsb-release xdg-utils wget cgroup-tools nethogs iproute2 psmisc htop && apt --fix-broken -y install \
 && apt-get -yq install fonts-ipafont-gothic fonts-wqy-zenhei fonts-thai-tlwg fonts-kacst ttf-ancient-fonts fontconfig psmisc fonts-freefont-ttf \
 && apt-get -yq install xfonts-utils fonts-droid-fallback xfonts-intl-asian \
 && apt-get -yq install fonts-liberation fonts-unfonts-core fonts-sil-charis xfonts-tipa ttf-dejavu \
 && curl -o font.deb http://ftp.br.debian.org/debian/pool/main/f/fonts-noto-color-emoji/fonts-noto-color-emoji_0~20180810-1_all.deb \
 && dpkg -i font.deb && rm font.deb \
 && apt -yq install libfreetype6 fontconfig libcairo-gobject2 libcairo2 \
 && wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb \
 && dpkg -i google-chrome-stable_current_amd64.deb && apt --fix-broken install \
 && rm google-chrome-stable_current_amd64.deb \
 && cd .. \
 && npm i -g node-dev \
 && apt install -y libvips libjpeg-dev \
 && npm i \
 && npm i --save-dev @babel/core @babel/preset-env @babel/runtime @babel/plugin-transform-runtime @babel/plugin-external-helpers @babel/polyfill rollup-plugin-babel rollup-plugin-commonjs whatwg-fetch \
 && sudo npm i -g rollup @babel/cli @babel/core @babel/preset-env @babel/runtime \
 && rollup public/image-start-app.js -c rollup.config.js --format iife --file public/bundle_start_i.js --name App \
 && babel public/bundle_start_i.js --presets=@babel/env > public/bundle_image_start.js \
 && rollup public/meta.js -c rollup.config.js --format iife --file public/meta_bundle_i.js --name Meta \
 && babel public/meta_bundle_i.js --presets=@babel/env > public/meta_bundle.js \
 && cd /content/RemoteView/public/voodoo \
 && npm install craydom style.dss jtype-system \
 && sed -i "s/8002/${PORT}/g" test.sh \
 
CMD /run.sh
