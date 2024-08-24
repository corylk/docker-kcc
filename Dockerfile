FROM ghcr.io/linuxserver/baseimage-kasmvnc:ubuntunoble

# environment settings
ENV \
       TITLE="KCC" \
       CUSTOM_PORT="8080" \
       HOME="/config" \
       PIP_BREAK_SYSTEM_PACKAGES=1 \
       QTWEBENGINE_DISABLE_SANDBOX="1" \
       REPO_GIT="https://github.com/ciromattia/kcc" \
       KCC_VERSION="master"

# install system dependencies
RUN apt-get update
RUN apt-get install -y \
       gcc \
       cmake \
       unzip \
       unrar \
       p7zip-full \
       p7zip-rar \
       libpng-dev \
       libjpeg-dev \
       git \
       wget \
       libnss3 \
       libopengl0 \
       libxkbcommon-x11-0 \
       libxcb-cursor0 \
       libxcb-icccm4 \
       libxcb-image0 \
       libxcb-keysyms1 \
       libxcb-randr0 \
       libxcb-render-util0 \
       libxcb-xinerama0 \
       python3 \
       python3-xdg \
       python3-pip \
       python3-dev

# install kindlegen
COPY files/ /tmp
RUN tar zxvf /tmp/kindlegen*tar.gz -C /usr/local/bin

# clean up
RUN  apt-get clean && \
       rm -rf \
              /tmp/* \
              /var/lib/apt/lists/* \
              /var/tmp/*

# install KCC
WORKDIR /app
RUN git clone https://github.com/ciromattia/kcc.git .
RUN pip install -r requirements.txt

# set autostart default
RUN echo "python3 /app/kcc.py" >  /defaults/autostart
