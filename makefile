HDF5_VERSION=hdf5-1.8.19

BUILD_ARGS += --build-arg HDF5_VERSION=${HDF5_VERSION}

downloads:
	wget https://support.hdfgroup.org/ftp/HDF5/releases/hdf5-1.8/${HDF5_VERSION}/src/${HDF5_VERSION}.tar.gz -P tars

build-no-compile:
# legacy build command. Builds the image without compiling WRF.
# will likely be removed on 
	docker build -t wrf_tutorial --build-arg argname=tutorial ${BUILD_ARGS} .

all: downloads build

run:
	docker run -it wrf_tutorial /bin/tcsh

run-link:
	docker run -it --name teachme -v ${pwd}/OUTPUT:/wrf/wrfoutput wrf_tutorial /bin/tcsh

run-no-save:
	docker run -u root -it --rm wrf_tutorial /bin/tcsh