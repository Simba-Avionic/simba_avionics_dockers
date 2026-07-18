FROM mcr.microsoft.com/devcontainers/base:noble

ENV DEBIAN_FRONTEND=noninteractive

# Włączenie repozytorium multiverse (wymagane dla czcionek Microsoftu na Ubuntu Noble)
RUN apt-get update && apt-get install -y --no-install-recommends software-properties-common \
    && add-apt-repository multiverse \
    && apt-get clean && rm -rf /var/lib/apt/lists/*

# Automatyczna akceptacja licencji dla czcionek Microsoftu
RUN echo "ttf-mscorefonts-installer msttcorefonts/accepted-mscorefonts-eula select true" | debconf-set-selections

# Instalacja pakietów LaTeX oraz czcionek
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
    lmodern \
    ghostscript \
    ttf-mscorefonts-installer \
    fontconfig \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Odświeżenie cache czcionek systemowych
RUN fc-cache -f -v

# Upewniamy się, że działamy na domyślnym użytkowniku devcontainera
USER vscode