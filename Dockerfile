FROM hisaboh/debian-texlive-ja
LABEL maintainer="hisaboh@gmail.com"

ENV PANDOC_VERSION=2.11.4
ENV PANDOC_PACKAGE=pandoc-${PANDOC_VERSION}-1-amd64.deb
ENV CROSSREF_VERSION=v0.3.9.1

WORKDIR /tmp

# install pandoc
RUN wget "https://github.com/jgm/pandoc/releases/download/${PANDOC_VERSION}/${PANDOC_PACKAGE}" && \
    dpkg -i "${PANDOC_PACKAGE}" && \
    rm "${PANDOC_PACKAGE}"

# install xz
RUN apt-get update && \
    apt-get install -y xz-utils && \
    # Clean caches
    apt-get autoremove -y && \
    apt-get clean

# install pandoc-crossref
RUN wget "https://github.com/lierdakil/pandoc-crossref/releases/download/${CROSSREF_VERSION}/pandoc-crossref-Linux.tar.xz" && \
    tar -Jxvf pandoc-crossref-Linux.tar.xz && \
    mv pandoc-crossref /usr/local/bin && \
    rm pandoc-crossref-Linux.tar.xz && \
    rm pandoc-crossref*

WORKDIR /usr/local/pandoc/config
COPY config /usr/local/pandoc/config

WORKDIR /workdir