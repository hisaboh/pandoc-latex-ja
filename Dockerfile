FROM hisaboh/debian-texlive-ja
LABEL maintainer="hisaboh@gmail.com"


ENV PANDOC_VERSION=2.16.2
# ENV PANDOC_PACKAGE=pandoc-${PANDOC_VERSION}-1-${ARCH}.deb
ENV CROSSREF_VERSION=v0.3.12.1a

WORKDIR /tmp

# install pandoc
RUN ARCH= && dpkgArch="$(dpkg --print-architecture)" &&\
  case "${dpkgArch##*-}" in \
    arm64) export ARCH='arm64';; \
    *) echo "unsupported architecture"; exit 1 ;; \
  esac &&\
  PANDOC_PACKAGE=pandoc-${PANDOC_VERSION}-1-${ARCH}.deb &&\
  wget "https://github.com/jgm/pandoc/releases/download/${PANDOC_VERSION}/${PANDOC_PACKAGE}" && \
    dpkg -i "${PANDOC_PACKAGE}" && \
    rm "${PANDOC_PACKAGE}"

# install xz
RUN apt-get update && \
    apt-get install -y xz-utils && \
    # Clean caches
    apt-get autoremove -y && \
    apt-get clean

# # install pandoc-crossref
# RUN wget "https://github.com/lierdakil/pandoc-crossref/releases/download/${CROSSREF_VERSION}/pandoc-crossref-Linux.tar.xz" && \
#     tar -Jxvf pandoc-crossref-Linux.tar.xz && \
#     mv pandoc-crossref /usr/local/bin && \
#     rm pandoc-crossref-Linux.tar.xz && \
#     rm pandoc-crossref*

# install cabal
RUN apt-get install -y cabal-install
RUN cabal update

#install pandoc-crossref
WORKDIR /tmp/pandoc-crossref

RUN apt install -y zlib1g-dev
RUN cabal sandbox init
RUN cabal install pandoc-crossref
RUN mv /tmp/.cabal-sandbox/bin/pandoc-crossref /usr/local/bin
RUN rm -rf /tmp/.cabal-sandbox/

WORKDIR /usr/local/pandoc/config
COPY config /usr/local/pandoc/config

WORKDIR /workdir