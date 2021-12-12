FROM hisaboh/debian-texlive-ja
LABEL maintainer="hisaboh@gmail.com"


ENV PANDOC_VERSION=2.16.2
# ENV PANDOC_PACKAGE=pandoc-${PANDOC_VERSION}-1-${ARCH}.deb
ENV CROSSREF_VERSION=v0.3.12.1a

WORKDIR /tmp

# Install dependencies *You don't need all of them
RUN apt-get update -y \
    && apt-get upgrade -y \
    && apt-get install -y git jq bc make automake \
    && apt-get install -y rsync htop curl build-essential \
    && apt-get install -y pkg-config libffi-dev libgmp-dev \
    && apt-get install -y libssl-dev libtinfo-dev libsystemd-dev \
    && apt-get install -y zlib1g-dev make g++ wget libncursesw5 libtool autoconf \
    && apt-get install -y libnuma-dev \
    && apt-get clean

# Install ghcup
ENV BOOTSTRAP_HASKELL_NONINTERACTIVE=1
ENV BOOTSTRAP_HASKELL_GHC_VERSION=8.10.7
ENV BOOTSTRAP_HASKELL_CABAL_VERSION=3.6.2.0
RUN bash -c "curl --proto '=https' --tlsv1.2 -sSf https://get-ghcup.haskell.org | sh"
# RUN bash -c "curl -sSL https://get.haskellstack.org/ | sh"

# Add ghcup to PATH
ENV PATH=${PATH}:/root/.local/bin
ENV PATH=${PATH}:/root/.ghcup/bin
ENV PATH=${PATH}:/root/.cabal/bin

# Update Path to include Cabal and GHC exports
RUN bash -c "echo PATH="$HOME/.local/bin:$PATH" >> $HOME/.bashrc"
RUN bash -c "echo export LD_LIBRARY_PATH="/usr/local/lib:$LD_LIBRARY_PATH" >> $HOME/.bashrc"
RUN bash -c "source $HOME/.bashrc"

# Update cabal
RUN bash -c "cabal update"


# Install pandoc
RUN apt-get install -y llvm
RUN cabal v2-update
# 本命
RUN cabal v2-install -j1 --install-method=copy pandoc pandoc-crossref pandoc-citeproc

WORKDIR /usr/local/pandoc/config
COPY config /usr/local/pandoc/config

WORKDIR /workdir
