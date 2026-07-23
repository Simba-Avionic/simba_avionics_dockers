FROM debian:bookworm-slim

ENV DEBIAN_FRONTEND=noninteractive

# 1. Włączenie repozytoriów contrib i non-free dla Debiana
RUN set -eux; \
    if [ -f /etc/apt/sources.list.d/debian.sources ]; then \
        sed -i 's/^Components: .*/Components: main contrib non-free non-free-firmware/' /etc/apt/sources.list.d/debian.sources; \
    else \
        echo 'deb http://deb.debian.org/debian bookworm main contrib non-free non-free-firmware' > /etc/apt/sources.list; \
    fi

# 2. Akceptacja licencji dla czcionek Microsoftu
RUN echo "ttf-mscorefonts-installer msttcorefonts/accepted-mscorefonts-eula select true" | debconf-set-selections

# 3. Instalacja pakietów systemowych (usunięty add-apt-repository oraz dubel latexdiff)
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
    git \
    ca-certificates \
    ghostscript \
    lmodern \
    latexdiff \
    chktex \
    perl \
    nodejs \
    npm \
    ttf-mscorefonts-installer \
    fontconfig \
    && fc-cache -f -v \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# 4. Globalny NPM w miejscu dostępnym dla każdego użytkownika
ENV NPM_CONFIG_PREFIX=/usr/local/share/npm-global
ENV PATH="${NPM_CONFIG_PREFIX}/bin:${PATH}"

RUN mkdir -p ${NPM_CONFIG_PREFIX} \
    && npm install -g cspell@8.17.5 \
    && npm cache clean --force

WORKDIR /workspace
