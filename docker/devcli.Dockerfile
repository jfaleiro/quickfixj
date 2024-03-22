# pasted from https://github.com/jfaleiro/container-devcli/blob/v0.1.5/Dockerfile

ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get clean \
    && apt-get update \
    && apt-get install --no-install-recommends -y \
        zsh \
        gh \
        openssh-client \
        rename \
        xclip \
    && echo "cleaning up..." \
    && apt-get autoremove -y \
    && apt-get clean -y \
    && rm -rf /var/lib/apt/lists/*

# Required for AWT (banzai) support (through XQuartz in MacOS)
RUN apt-get clean \
    && apt-get update \
    && apt-get install --no-install-recommends -y \
        fontconfig \
        libxi6 \
        libxtst6 \
        libxrender1 \
    && echo "cleaning up..." \
    && apt-get autoremove -y \
    && apt-get clean -y \
    && rm -rf /var/lib/apt/lists/*


# see https://github.com/ohmyzsh/ohmyzsh/wiki
# RUN sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
RUN sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended

# Required for sdk on zsh - see https://github.com/sdkman/sdkman-cli/issues/613#issuecomment-696557301
RUN echo '# SDKMAN!' >> "$HOME/.zshrc"
RUN echo 'source "$SDKMAN_DIR/bin/sdkman-init.sh"' >> "$HOME/.zshrc"
RUN cat "$HOME/.zshrc"

ENV DEBIAN_FRONTEND=dialog \
    LANG=C.UTF-8 \
    LC_ALL=C.UTF-8