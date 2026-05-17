FROM mcr.microsoft.com/devcontainers/base:noble

ENV DEBIAN_FRONTEND=noninteractive

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
    ghostscript \
    # Dodanie czcionek Microsoftu i odświeżenie pamięci podręcznej czcionek
    ttf-mscorefonts-installer \
    fontconfig \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

USER vscode