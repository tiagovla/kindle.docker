FROM debian:buster

ARG DEBIAN_FRONTEND=noninteractive
RUN dpkg --add-architecture i386

RUN apt update && apt install -y \
    cabextract \
    wine \
    wget \
    zip \
    curl \
    && rm -rf /var/lib/apt/lists/*\
    && wget "https://raw.githubusercontent.com/Winetricks/winetricks/master/src/winetricks"\
    && chmod +x winetricks\
    && mv winetricks /usr/bin\
    && rm -rf /var/lib/apt/lists/*

RUN useradd -m -s /bin/bash kindle
USER kindle

RUN winetricks -q python || :
RUN winetricks -q kindle || :
RUN wget --directory-prefix=/home/kindle\
    https://raw.githubusercontent.com/apprenticeharper/DeDRM_tools/464788a3f1f8f1ef045a397f2bc12c18f4eeb943/DeDRM_plugin/kindlekey.py
CMD wine "/home/kindle/.wine/drive_c/Program Files (x86)/Amazon/Kindle/Kindle.exe" && \
    wine "/home/kindle/.wine/drive_c/Python26/python.exe" "/home/kindle/kindlekey.py" && \
    mv "/home/kindle/kindlekey1.k4i" "/home/kindle/My Kindle Content/kindlekey.k4i"
