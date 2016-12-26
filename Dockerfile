# AUTOMATICALLY GENERATED
# DO NOT EDIT THIS FILE DIRECTLY, USE /Dockerfile-template.j2

# https://hub.docker.com/r/google/dart/
FROM google/dart:1.19.1

MAINTAINER Instrumentisto Team <developer@instrumentisto.com>


RUN mkdir -p /tmp/dart \

 # Install third-party dependencies
 && DEBIAN_FRONTEND=noninteractive \
 && echo 'deb http://deb.debian.org/debian jessie contrib' \
                                                      >> /etc/apt/sources.list \
 && apt-get update \
 && (echo ttf-mscorefonts-installer msttcorefonts/accepted-mscorefonts-eula \
                                         select true | debconf-set-selections) \
 && apt-get install --no-install-recommends -y -q \
                    unzip \
                    xvfb xauth \
                    chromedriver \
                    libgconf-2-4 \
                    fonts-thai-tlwg \
                    fonts-indic \
                    ttf-dejavu-core fonts-dejavu-core \
                    ttf-kochi-gothic ttf-kochi-mincho \
                    msttcorefonts \

 # Trick to fake ttf-indic-fonts-core since ttf-indic-fonts is transitional
 && mkdir -p /usr/share/fonts/truetype/ttf-indic-fonts-core \
 && ln -s /usr/share/fonts/truetype/lohit-punjabi/Lohit-Punjabi.ttf \
          /usr/share/fonts/truetype/ttf-indic-fonts-core/lohit_hi.ttf \
 && ln -s /usr/share/fonts/truetype/lohit-punjabi/Lohit-Punjabi.ttf \
          /usr/share/fonts/truetype/ttf-indic-fonts-core/lohit_pa.ttf \
 && ln -s /usr/share/fonts/truetype/lohit-tamil/Lohit-Tamil.ttf \
          /usr/share/fonts/truetype/ttf-indic-fonts-core/lohit_ta.ttf \
 && ln -s /usr/share/fonts/truetype/fonts-beng-extra/MuktiNarrow.ttf \
          /usr/share/fonts/truetype/ttf-indic-fonts-core/MuktiNarrow.ttf \

 # Install content_shell of required version
 && curl -L -o /tmp/dart/content_shell.zip \
         https://storage.googleapis.com/dart-archive/channels/stable/release/1.19.1/dartium/content_shell-linux-x64-release.zip \
 && unzip /tmp/dart/content_shell.zip -d /tmp/dart/ \
 && mv /tmp/dart/drt-lucid64* /usr/local/content_shell \

 && apt-get purge -y --force-yes \
                  unzip \
 && apt-get clean \
 && rm -rf /tmp/dart \
           /var/lib/apt/lists/*

ENV PATH=$PATH:/usr/local/content_shell


VOLUME ["/app"]

WORKDIR /app

ENTRYPOINT xvfb-run -s '-screen 0 1024x768x24' $0 $*
