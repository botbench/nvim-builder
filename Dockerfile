# Dockerised nvim builder
# Xander Soldaat <xander@botbench.com>

FROM debian:bookworm

ENV DEBIAN_FRONTEND=noninteractive \
    NVIM_URL=https://github.com/neovim/neovim.git \
    INSTALL_DIR=/opt/nvim \
    DUMP_DIR=/mnt

ARG USERNAME=nvimbuild
ARG USER_UID=1000
ARG USER_GID=1000

RUN groupadd --gid ${USER_GID} ${USERNAME} && \
    useradd -m -s /bin/bash --uid ${USER_UID} --gid ${USER_GID} ${USERNAME}


# Install dependencies and clean up
RUN apt-get update && apt-get install -y \
    git \
    ninja-build \
    gettext \
    cmake \
    unzip \
    curl \
    bash \
    bzip2 \
    && rm -rf /var/lib/apt/lists/*
    
RUN mkdir -p /source ${INSTALL_DIR} && chown ${USERNAME} /source ${INSTALL_DIR} 
COPY buildnvim.sh /source

USER nvimbuild
WORKDIR /source 
CMD ["/bin/sh", "/source/buildnvim.sh"]
