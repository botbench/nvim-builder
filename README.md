# Build neovim stable for Debian Bookworm
This container will build the latest version of neovim stable, to be installed in `/opt/nvim`. 

## How to get started

Build with `docker build -t nvimbuilder:latest .`

Create a folder where the container will dump the resulting tar ball with the executable, and other files. This will folder will be mounted inside the container.

Run the container with `docker run --rm -ti -v ${PWD}/dumpdolder:/mnt:Z nvimbuilder:latest`, where the volume mounted on /mnt is the host's folder where the resulting built tar.bz2 file will be placed.

Then unpack the resulting tar ball with `sudo -C /opt -xvf  ${PWD}/dumpdolder/nvim.tar.bz2`. Make sure to add `/opt/nvim/bin` directory to your `$PATH` variable.
