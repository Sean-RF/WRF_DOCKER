HDF5_VERSION=hdf5-1.8.19

BUILD_ARGS += --build-arg HDF5_VERSION=${HDF5_VERSION}

downloads:
	wget https://support.hdfgroup.org/ftp/HDF5/releases/hdf5-1.8/${HDF5_VERSION}/src/${HDF5_VERSION}.tar.gz -P tars

build: downloads
	docker build -t wrf_tutorial --build-arg argname=tutorial ${BUILD_ARGS} .
