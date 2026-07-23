FROM debian:bookworm-slim

ENV DEBIAN_FRONTEND=noninteractive

# 1. Dodanie repozytoriów contrib i non-free (wymagane dla ttf-mscorefonts-installer)
RUN set -eux; \
    if [ -f /etc/apt/sources.list.d/debian.sources ]; then \
        sed -i 's/^Components: .*/Components: main contrib non-free non-free-firmware/' /etc/apt/sources.list.d/debian.sources; \
    else \
        echo 'deb http://deb.debian.org/debian bookworm main contrib non-free non-free-firmware' > /etc/apt/sources.list; \
    fi

# 2. Automatyczna akceptacja licencji MS EULA
RUN echo "ttf-mscorefonts-installer msttcorefonts/accepted-mscorefonts-eula select true" | debconf-set-selections

RUN apt-get update && apt-get install -y --no-install-recommends software-properties-common \
    && add-apt-repository -y universe \
    && add-apt-repository -y multiverse \
    && apt-get clean && rm -rf /var/lib/apt/lists/*

RUN apt-get update && apt-get install -y --no-install-recommends \
    build-essential \
    cmake \
    texlive-binaries \
    texlive-xetex \
    texlive-plain-generic \
    texlive-bibtex-extra \
    texlive-latex-extra \
    texlive-fonts-recommended \
    texlive-fonts-extra \
    texlive-lang-polish \
    latexmk \
    ghostscript \
    lmodern \
    latexdiff \
    chktex \
    nodejs \
    npm \
    ttf-mscorefonts-installer \
    fontconfig \
    && fc-cache -f -v \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

RUN npm install -g cspell@8.17.5 \
    && npm cache clean --force

WORKDIR /workspace