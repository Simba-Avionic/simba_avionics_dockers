FROM mcr.microsoft.com/devcontainers/base:noble

ENV DEBIAN_FRONTEND=noninteractive

# Włączenie repozytoriów universe i multiverse
RUN apt-get update && apt-get install -y --no-install-recommends software-properties-common \
    && add-apt-repository -y universe \
    && add-apt-repository -y multiverse \
    && apt-get clean && rm -rf /var/lib/apt/lists/*

# Akceptacja licencji dla czcionek Microsoftu
RUN echo "ttf-mscorefonts-installer msttcorefonts/accepted-mscorefonts-eula select true" | debconf-set-selections

# Instalacja paczek systemowych (usunięty duplikat latexdiff, dodana obsługa Perla)
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
    git \
    ca-certificates \
    lmodern \
    ghostscript \
    perl \
    nodejs \
    npm \
    ttf-mscorefonts-installer \
    fontconfig \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Konfiguracja globalna NPM, aby działała dla użytkownika vscode
ENV NPM_CONFIG_PREFIX=/usr/local/share/npm-global
ENV PATH="${NPM_CONFIG_PREFIX}/bin:${PATH}"

RUN mkdir -p ${NPM_CONFIG_PREFIX} \
    && npm install -g cspell@8.17.5 \
    && npm cache clean --force

# Odświeżenie pamięci podręcznej czcionek
RUN fc-cache -f -v

USER vscode