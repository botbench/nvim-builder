Build with `docker build -t nvimbuilder:latest .`

Run with `docker run --rm -ti -v ${PWD}/foo:/mnt:Z nvimbuilder:latest`, where the volume mounted on /mnt is the host's folder where the resulting built tar.bz2 file will be placed.

