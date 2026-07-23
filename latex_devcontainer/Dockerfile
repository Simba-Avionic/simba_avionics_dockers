FROM mcr.microsoft.com/devcontainers/base:noble

ENV DEBIAN_FRONTEND=noninteractive

# Włączenie universe + multiverse (chktex jest w universe; czcionki MS w multiverse)
RUN apt-get update && apt-get install -y --no-install-recommends software-properties-common \
    && add-apt-repository -y universe \
    && add-apt-repository -y multiverse \
    && apt-get clean && rm -rf /var/lib/apt/lists/*

# Automatyczna akceptacja licencji dla czcionek Microsoftu
RUN echo "ttf-mscorefonts-installer msttcorefonts/accepted-mscorefonts-eula select true" | debconf-set-selections

RUN apt-get update && apt-get install -y --no-install-recommends \
    texlive-binaries \
    texlive-xetex \
    texlive-plain-generic \
    texlive-bibtex-extra \
    texlive-latex-extra \
    texlive-fonts-recommended \
    texlive-fonts-extra \
    texlive-lang-polish \
    latexmk \
    latexdiff \
    chktex \
    lmodern \
    ghostscript \
    nodejs \
    npm \
    ttf-mscorefonts-installer \
    fontconfig \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

RUN npm install -g cspell@8.17.5 \
    && npm cache clean --force

RUN fc-cache -f -v

USER vscode
