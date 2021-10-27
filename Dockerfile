FROM debian:buster

ARG DEBIAN_FRONTEND=noninteractive
RUN dpkg --add-architecture i386

RUN apt update && apt install -y \
    cabextract \
    wine \
    wget \
    curl \
    && rm -rf /var/lib/apt/lists/*\
    && wget "https://raw.githubusercontent.com/Winetricks/winetricks/master/src/winetricks"\
    && chmod +x winetricks\
    && mv winetricks /usr/bin\
    && rm -rf /var/lib/apt/lists/*

RUN useradd -m -s /bin/bash kindle
USER kindle

RUN winetricks -q kindle || :
CMD wine "/home/kindle/.wine/drive_c/Program Files (x86)/Amazon/Kindle/Kindle.exe"
