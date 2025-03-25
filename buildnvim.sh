# Dockerised nvim builder
# Xander Soldaat <xander@botbench.com>

mkdir -vp ${DUMP_DIR}
mkdir -vp ${INSTALL_DIR}

git clone -b stable ${NVIM_URL} && \
cd neovim && \
make CMAKE_BUILD_TYPE=Release CMAKE_INSTALL_PREFIX=${INSTALL_DIR} install && \
tar -C ${INSTALL_DIR}/.. -cjvf ${DUMP_DIR}/nvim.tar.bz2 nvim

