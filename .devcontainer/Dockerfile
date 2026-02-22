# Sourcery won't run on `arm` so force the use of `amd64` for the base image.
FROM mcr.microsoft.com/devcontainers/base:trixie

# Install uv for everyone not just the current user.
RUN curl -LsSf https://astral.sh/uv/install.sh | sh \
    && cp /root/.local/bin/uv /usr/local/bin/uv

# Install LaTeX.
RUN apt --quiet update \
    && apt install --assume-yes texlive-latex-extra texlive-extra-utils latexmk tex-fmt just \
    && apt clean \
    && rm -rf /var/lib/apt/lists/*

# Add some labels so it looks nice in Github packages.
LABEL org.opencontainers.image.source=https://github.com/joejcollins/colonel-white
LABEL org.opencontainers.image.description="colonel-white image."